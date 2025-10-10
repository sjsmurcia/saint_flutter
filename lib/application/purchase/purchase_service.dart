import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';
import '../../domain/models/purchase_document.dart';

class PurchaseService {
  PurchaseService(this._ref);

  final Ref _ref;

  Future<PurchaseDocument> createDraft({required double total}) async {
    final authState = _ref.read(authControllerProvider);
    final session = authState.maybeWhen(
      authenticated: (session) => session,
      orElse: () => null,
    );
    if (session == null) {
      throw StateError('No hay sesion activa');
    }

    final companyState = _ref.read(companySelectionControllerProvider);
    final company = companyState.selectedCompany;
    final branch = companyState.selectedBranch;
    if (company == null || branch == null) {
      throw StateError('Selecciona una empresa y sucursal');
    }

    final repository = _ref.read(purchaseRepositoryProvider);
    return repository.createDraft(
      tenantId: session.tenantId,
      companyId: company.id,
      branchId: branch.id,
      total: total,
    );
  }
}

final purchaseServiceProvider = Provider<PurchaseService>((ref) {
  return PurchaseService(ref);
});
