import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';
import '../../domain/models/product.dart';
import '../common/paged_state.dart';

class ProductListController extends StateNotifier<PagedState<Product>> {
  ProductListController(this._ref) : super(const PagedState()) {
    _initialize();
  }

  final Ref _ref;
  static const _pageSize = 20;
  bool _initializing = false;

  Future<void> _initialize() async {
    if (_initializing) {
      return;
    }
    _initializing = true;
    await loadInitial();
    _initializing = false;
  }

  Future<void> loadInitial() async {
    final tenantId = _currentTenant();
    if (tenantId == null) {
      state = state.copyWith(
        items: const [],
        hasMore: false,
        isLoading: false,
        errorMessage: null,
      );
      return;
    }
    state = state.copyWith(
      items: const [],
      hasMore: true,
      isLoading: true,
      errorMessage: null,
    );
    await _loadPage(tenantId: tenantId, offset: 0, reset: true);
  }

  Future<void> refresh() async {
    final tenantId = _currentTenant();
    if (tenantId == null) {
      return;
    }
    state = state.copyWith(errorMessage: null);
    await _loadPage(tenantId: tenantId, offset: 0, reset: true);
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }
    final tenantId = _currentTenant();
    if (tenantId == null) {
      return;
    }
    state = state.copyWith(isLoadingMore: true, errorMessage: null);
    await _loadPage(
      tenantId: tenantId,
      offset: state.items.length,
      reset: false,
    );
  }

  Future<void> _loadPage({
    required String tenantId,
    required int offset,
    required bool reset,
  }) async {
    try {
      final repository = _ref.read(productRepositoryProvider);
      final page = await repository.fetchPage(
        tenantId: tenantId,
        limit: _pageSize,
        offset: offset,
      );
      final items = reset ? page : [...state.items, ...page];
      state = state.copyWith(
        items: items,
        hasMore: page.length == _pageSize,
        isLoading: false,
        isLoadingMore: false,
        errorMessage: null,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        errorMessage: error.toString(),
      );
    }
  }

  String? _currentTenant() {
    final authState = _ref.read(authControllerProvider);
    return authState.maybeWhen(
      authenticated: (session) => session.tenantId,
      orElse: () => null,
    );
  }
}
