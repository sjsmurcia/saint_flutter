// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import '../../../application/bank/bank_service.dart';
import '../../../application/sync/sync_coordinator.dart';
import '../../../di/providers.dart';
import '../../../domain/models/bank_account.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/company_selector_sheet.dart';

class BanksPage extends ConsumerStatefulWidget {
  const BanksPage({super.key});

  @override
  ConsumerState<BanksPage> createState() => _BanksPageState();
}

class _BanksPageState extends ConsumerState<BanksPage> {
  String? _selectedAccountId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accountsAsync = ref.watch(bankAccountsStreamProvider);

    return AppScaffold(
      title: l10n?.banksTitle ?? 'Bancos',
      child: accountsAsync.when(
        data: (accounts) {
          if (accounts.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(l10n?.banksEmpty ?? 'Sin cuentas bancarias'),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => showCompanySelectorSheet(context),
                  child: Text(
                    l10n?.companySelectorTooltip ?? 'Cambiar empresa',
                  ),
                ),
              ],
            );
          }

          final selectedAccount = _resolveSelectedAccount(accounts);
          final movementsAsync = ref.watch(
            bankMovementsStreamProvider(selectedAccount.id),
          );
          final currencyFormatter = NumberFormat.simpleCurrency(
            name: selectedAccount.currency,
          );
          final dateFormatter = DateFormat.yMMMd().add_Hm();

          return RefreshIndicator(
            onRefresh: () => ref.read(syncCoordinatorProvider).syncNow(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DropdownButtonFormField<String>(
                  key: ValueKey(selectedAccount.id),
                  initialValue: selectedAccount.id,
                  decoration: InputDecoration(
                    labelText: l10n?.bankAccountLabel ?? 'Cuenta',
                  ),
                  items: accounts
                      .map(
                        (account) => DropdownMenuItem<String>(
                          value: account.id,
                          child: Text(
                            '${account.name} - ${currencyFormatter.format(account.balance)}',
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedAccountId = value),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () =>
                      _showMovementDialog(context, selectedAccount.id, l10n),
                  icon: const Icon(Icons.add),
                  label: Text(l10n?.registerMovement ?? 'Registrar movimiento'),
                ),
                const SizedBox(height: 24),
                movementsAsync.when(
                  data: (movements) {
                    if (movements.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Center(
                          child: Text(
                            l10n?.movementsEmpty ??
                                'Sin movimientos registrados',
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: movements
                          .map(
                            (movement) => Card(
                              child: ListTile(
                                leading: Icon(
                                  movement.type == 'withdraw'
                                      ? Icons.south_west
                                      : Icons.north_east,
                                  color: movement.type == 'withdraw'
                                      ? Colors.redAccent
                                      : Colors.green,
                                ),
                                title: Text(
                                  currencyFormatter.format(movement.amount),
                                ),
                                subtitle: Text(
                                  '${movement.description ?? '-'} - ${dateFormatter.format(movement.occurredAt.toLocal())}',
                                ),
                                trailing: Text(movement.status),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Column(
                    children: [
                      Text(l10n?.genericError ?? 'Ocurrio un error'),
                      const SizedBox(height: 8),
                      Text(error.toString()),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(l10n?.genericError ?? 'Ocurrio un error'),
            const SizedBox(height: 8),
            Text(error.toString()),
          ],
        ),
      ),
    );
  }

  Future<void> _showMovementDialog(
    BuildContext context,
    String accountId,
    AppLocalizations? l10n,
  ) async {
    final amountController = TextEditingController();
    String type = 'deposit';
    String? description;
    DateTime occurredAt = DateTime.now();
    final formKey = GlobalKey<FormState>();

    final saved = await showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(l10n?.registerMovement ?? 'Registrar movimiento'),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: type,
                      decoration: InputDecoration(
                        labelText: l10n?.movementTypeLabel ?? 'Tipo',
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'deposit',
                          child: Text(l10n?.movementDeposit ?? 'Deposito'),
                        ),
                        DropdownMenuItem(
                          value: 'withdraw',
                          child: Text(l10n?.movementWithdraw ?? 'Retiro'),
                        ),
                      ],
                      onChanged: (value) =>
                          setState(() => type = value ?? 'deposit'),
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: l10n?.documentTotalLabel ?? 'Importe total',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n?.fieldRequired ?? 'Campo requerido';
                        }
                        final parsed = double.tryParse(
                          value.replaceAll(',', '.'),
                        );
                        if (parsed == null || parsed <= 0) {
                          return l10n?.invalidAmount ?? 'Monto invalido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            l10n?.movementDescriptionLabel ?? 'Descripcion',
                      ),
                      onChanged: (value) => description = value,
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.calendar_today),
                      title: Text(DateFormat.yMMMd().format(occurredAt)),
                      subtitle: Text(DateFormat.Hm().format(occurredAt)),
                      onTap: () async {
                        final currentContext = context;
                        final date = await showDatePicker(
                          context: currentContext,
                          initialDate: occurredAt,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (!mounted) {
                          return;
                        }
                        if (date == null) {
                          return;
                        }
                        final time = await showTimePicker(
                          context: currentContext,
                          initialTime: TimeOfDay.fromDateTime(occurredAt),
                        );
                        if (!mounted) {
                          return;
                        }
                        if (time == null) {
                          return;
                        }
                        setState(() {
                          occurredAt = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(l10n?.close ?? 'Cerrar'),
                ),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop(true);
                    }
                  },
                  child: Text(l10n?.save ?? 'Guardar'),
                ),
              ],
            );
          },
        );
      },
    );

    if (saved != true) {
      return;
    }

    final amount = double.parse(amountController.text.replaceAll(',', '.'));
    try {
      await ref
          .read(bankServiceProvider)
          .registerMovement(
            accountId: accountId,
            amount: amount,
            type: type,
            description: description?.trim().isEmpty ?? true
                ? null
                : description?.trim(),
            occurredAt: occurredAt,
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.documentCreatedMessage ?? 'Movimiento registrado',
            ),
          ),
        );
      }
    } catch (error) {
      if (!context.mounted) return;
      final message = error is StateError ? error.message : error.toString();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  BankAccount _resolveSelectedAccount(List<BankAccount> accounts) {
    final account = accounts.firstWhere(
      (item) => item.id == _selectedAccountId,
      orElse: () => accounts.first,
    );
    _selectedAccountId = account.id;
    return account;
  }
}
