import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:sport_app/core/util/secure_storage.dart';

import '../../../core/data/network/api_manager.dart';
import '../../../core/data/requests/auth_requests.dart';
import '../../../core/service_locator/service_locator.dart';
import '../models/auth_models.dart';

class AuthService {
  final _apiManager = locator<APIManager>();

  final _secureStorageManager = locator<SecureStorageManager>();

  Future<AuthResponse> login(AuthLoginBody body) async {
    final request = AuthRequests.login.request();

    try {
      final Map<String, dynamic> response =
          await _apiManager.call(request, body: body.toJson());

      final AuthResponse authResponse = AuthResponse.fromJson(response);
      if (authResponse.name != null && authResponse.token != null) {
        _secureStorageManager.registerUser(
            name: authResponse.name!, token: authResponse.token!);
      }

      return authResponse;
    } catch (e) {
      rethrow;
    }
    // return AuthResponse();
  }
}
