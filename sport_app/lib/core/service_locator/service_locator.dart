import 'package:get_it/get_it.dart';
import 'package:sport_app/core/util/secure_storage.dart';
import 'package:sport_app/features/home/service/home_service.dart';
import 'package:sport_app/features/login/service/auth_service.dart';

import '../data/network/api_manager.dart';

final locator = GetIt.I;
void setUpServiceLocator() {
  locator.registerSingleton<APIManager>(APIManager());
  locator.registerSingleton<SecureStorageManager>(SecureStorageManager());
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<HomeService>(HomeService());
  // locator.registerSingleton<AuthService>(AuthService());
}
