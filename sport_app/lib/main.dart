import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_app/features/home/screens/home_screen.dart';
import 'package:sport_app/features/login/controller/auth_controller.dart';

import 'core/service_locator/service_locator.dart';
import 'core/style/theme.dart';

import 'core/util/secure_storage.dart';
import 'features/login/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  bool jailbroken = await FlutterJailbreakDetection.jailbroken;

  runApp(ProviderScope(
    child: jailbroken ? JailbreakScreen() : MainApp(),
  ));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StateMainApp();
}

class _StateMainApp extends ConsumerState<MainApp> {
  final secureStorageManager = locator<SecureStorageManager>();
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final authController = ref.read(authControllerProvider);
    // authController.setUser()

    Future(() async {
      secureStorageManager.getUser().then((value) {
        if (value != null) {
          authController.setUser(value);
          authController.user = value;
          print(authController.user?.name);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var authController = ref.watch(authControllerProvider);
    return MaterialApp(
      theme: AppTheme.theme,
      home: authController.isSignedIn ? HomeScreen() : LoginScreen(),
    );
  }
}

class JailbreakScreen extends StatelessWidget {
  const JailbreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      ),
    );
  }
}
