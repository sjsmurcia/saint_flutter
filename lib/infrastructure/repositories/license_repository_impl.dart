import '../../domain/models/license_info.dart';
import '../../domain/repositories/license_repository.dart';
import '../../utils/license_token_decoder.dart';
import '../remote/license_api.dart';
import '../storage/license_storage.dart';

class LicenseRepositoryImpl implements LicenseRepository {
  LicenseRepositoryImpl(
    this._api,
    this._storage,
    this._decoder,
  );

  final LicenseApi _api;
  final LicenseStorage _storage;
  final LicenseTokenDecoder _decoder;

  @override
  Future<LicenseInfo?> restore() async {
    final token = await _storage.readToken();
    if (token == null) {
      return null;
    }
    try {
      return await _decoder.decode(token);
    } catch (_) {
      await _storage.clear();
      return null;
    }
  }

  @override
  Future<void> persist(LicenseInfo info) {
    return _storage.saveToken(info.token);
  }

  @override
  Future<void> clear() {
    return _storage.clear();
  }

  @override
  Future<String> deviceFingerprint() {
    return _storage.obtainDeviceFingerprint();
  }

  @override
  Future<LicenseInfo> activate({
    required String licenseKey,
    String? deviceFingerprint,
  }) async {
    final response = await _api.activate(
      licenseKey: licenseKey,
      deviceFingerprint: deviceFingerprint,
    );
    final info = await _decoder.decode(response.licenseToken);
    await _storage.saveToken(info.token);
    return info;
  }

  @override
  Future<LicenseInfo> checkIn({
    required String token,
    String? deviceFingerprint,
  }) async {
    final response = await _api.checkIn(
      licenseToken: token,
      deviceFingerprint: deviceFingerprint,
    );
    final info = await _decoder.decode(response.licenseToken);
    await _storage.saveToken(info.token);
    return info;
  }
}
