import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_app/core/widgets/background_color.dart';
import 'package:sport_app/core/widgets/item_background_color.dart';
import 'package:sport_app/core/widgets/item_title.dart';
import 'package:sport_app/features/login/controller/auth_controller.dart';
import 'package:sport_app/features/login/models/auth_models.dart';
import 'package:sport_app/features/login/widgets/auth_textfield.dart';

import '../../../core/style/app_colors.dart';
import '../../../core/widgets/buttons.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController username =
      TextEditingController(text: "email@mail.com");
  TextEditingController password = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context) {
    var authController = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        Text(
                          "let's Get Exercise",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                LayoutBuilder(builder: (context, size) {
                  final width = size.constrainWidth();

                  return SizedBox(
                    width: width,
                    child: GradientWidget(
                      child: Icon(
                        Icons.directions_bike,
                        size: width * 0.7,
                      ),
                    ),
                  );
                }),
                AuthTextField(
                  controller: username,
                ).viewBackground().itemTitle("User name"),
                const SizedBox(
                  height: 16,
                ),
                AuthTextField(
                  controller: password,
                ).viewBackground().itemTitle("Password"),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Reset Password")),
                    PrimaryButton(
                      childBody: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: (authController.showLoading)
                            ? CircularProgressIndicator()
                            : Text("Login"),
                      ),
                      onPressed: () {
                        final authLoginBody = AuthLoginBody(
                            email: username.text, password: password.text);
                        authController.login(body: authLoginBody);
                        // context.pushTo(context, target: const HomeScreen());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ).backgroundColor(),
    );
  }
}

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) =>
          AppColors.primaryGradinColor.createShader(bounds),
      child: child,
    );
  }
}
