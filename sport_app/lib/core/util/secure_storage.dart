import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_app/features/login/models/auth_models.dart';

class SecureStorageManager {
// Create storage
  final storage = FlutterSecureStorage();

  Future<void> registerUser(
      {required String name, required String token}) async {
    await storage.write(key: "name", value: name);
    await storage.write(key: "token", value: token);
  }

  Future<AuthResponse?> getUser() async {
    String? name = await storage.read(key: "name");
    String? token = await storage.read(key: "token");

    if (name != null && token != null) {
      return AuthResponse(name: name, token: token);
    }
    return null;
  }

  Future<void> removeUser() async {
    await storage.deleteAll();
  }
}
