import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class LicenseStorage {
  LicenseStorage(this._storage);

  final FlutterSecureStorage _storage;
  final _uuid = const Uuid();

  static const _tokenKey = 'license_token';
  static const _deviceKey = 'license_device_id';

  Future<void> saveToken(String token) {
    return _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> readToken() {
    return _storage.read(key: _tokenKey);
  }

  Future<void> clear() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<String> obtainDeviceFingerprint() async {
    final stored = await _storage.read(key: _deviceKey);
    if (stored != null && stored.isNotEmpty) {
      return stored;
    }
    final generated = _uuid.v4();
    await _storage.write(key: _deviceKey, value: generated);
    return generated;
  }
}
