import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import '../../application/sync/sync_coordinator.dart';
import '../../di/providers.dart';

Future<void> showCompanySelectorSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(companySelectionControllerProvider);
          final l10n = AppLocalizations.of(context);

          if (state.isLoading) {
            return const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state.companies.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                l10n?.companySelectorEmpty ?? 'Sin empresas disponibles',
              ),
            );
          }

          final selectedCompanyId =
              state.selectedCompany?.id ?? state.companies.first.id;
          final selectedBranchId =
              state.selectedBranch?.id ??
              state.companies.first.branches.first.id;

          Future<void> handleSelectBranch(
            String companyId,
            String branchId,
          ) async {
            final auth = ref.read(authControllerProvider);
            final session = auth.maybeWhen(
              authenticated: (session) => session,
              orElse: () => null,
            );
            if (session == null) {
              return;
            }
            await ref
                .read(companySelectionControllerProvider.notifier)
                .select(
                  tenantId: session.tenantId,
                  companyId: companyId,
                  branchId: branchId,
                );
            await ref.read(syncCoordinatorProvider).syncNow();
          }

          final branches = state.companies
              .firstWhere((company) => company.id == selectedCompanyId)
              .branches;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n?.companySelectorTitle ?? 'Selecciona empresa y sucursal',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: l10n?.companyLabel ?? 'Empresa',
                  ),
                  child: DropdownButton<String>(
                    value: selectedCompanyId,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    items: state.companies
                        .map(
                          (company) => DropdownMenuItem<String>(
                            value: company.id,
                            child: Text(company.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      final company = state.companies.firstWhere(
                        (item) => item.id == value,
                      );
                      if (company.branches.isNotEmpty) {
                        handleSelectBranch(
                          company.id,
                          company.branches.first.id,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n?.branchLabel ?? 'Sucursal',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: branches
                      .map(
                        (branch) => ChoiceChip(
                          label: Text(branch.name),
                          selected: selectedBranchId == branch.id,
                          onSelected: (_) =>
                              handleSelectBranch(selectedCompanyId, branch.id),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n?.close ?? 'Cerrar'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
