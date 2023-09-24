import 'package:flutter/cupertino.dart';

import '../../../core/widgets/textfield.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 52,
        child: AppTextField(
          controller: controller,
          obscureText: isPassword,
        ));
  }
}
