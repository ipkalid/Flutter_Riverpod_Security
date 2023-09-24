import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_app/features/login/models/auth_models.dart';
import 'package:sport_app/features/login/service/auth_service.dart';

import '../../../core/service_locator/service_locator.dart';
import '../../../core/util/secure_storage.dart';

class AuthController extends ChangeNotifier {
  final _authService = locator<AuthService>();

  final _secureStorageManager = locator<SecureStorageManager>();

  AuthResponse? user;

  bool showLoading = false;

  bool get isSignedIn => user != null && user!.token != null;

  Future<void> signOut() async {
    user = null;
    notifyListeners();
  }

  setUser(AuthResponse user) {
    user = user;
    notifyListeners();
  }

  Future<void> login({required AuthLoginBody body}) async {
    user = null;
    showLoading = true;
    notifyListeners();
    try {
      user = await _authService.login(body);
    } catch (e) {
      print(e.toString());
    }

    showLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _secureStorageManager.removeUser();
    user = null;
    notifyListeners();
  }
}

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});
