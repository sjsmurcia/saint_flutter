import 'package:dio/dio.dart';

class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Respuesta vacia del servicio de autenticacion');
      }
      return data;
    } on DioException catch (error) {
      final detail = error.response?.data;
      final message =
          detail is Map<String, dynamic>
              ? detail['title'] as String? ??
                  detail['detail'] as String? ??
                  error.message
              : error.message;
      throw StateError(message ?? 'Fallo el inicio de sesion');
    }
  }
}
