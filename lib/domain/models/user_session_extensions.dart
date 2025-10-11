import 'user_session.dart';

extension UserSessionX on UserSession {
  bool hasPermission(String permission) {
    final normalized = permission.toLowerCase();
    if (role.toLowerCase() == 'admin') {
      return true;
    }
    final lowered = permissions.map((value) => value.toLowerCase()).toList();
    return lowered.contains('*') || lowered.contains(normalized);
  }
}
