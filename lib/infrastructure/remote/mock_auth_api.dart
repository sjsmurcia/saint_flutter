import 'dart:async';

class MockAuthApi {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (email.toLowerCase() == 'demo@saint.com' && password == 'demo123') {
      final expiresAt = DateTime.now()
          .add(const Duration(hours: 8))
          .toIso8601String();
      return {
        'token': 'mock-token-123',
        'expiresAt': expiresAt,
        'tenantId': 'tenant-001',
        'userName': 'Demo User',
      };
    }
    throw Exception('invalid-credentials');
  }
}
