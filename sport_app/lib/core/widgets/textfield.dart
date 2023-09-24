import 'package:flutter/material.dart';

class AppTextField extends TextField {
  final String? title;
  const AppTextField({
    super.key,
    this.title,
    super.controller,
    super.autocorrect = false,
    super.obscureText = false,
  });

  @override
  TextStyle? get style => const TextStyle(fontWeight: FontWeight.w500);

  @override
  InputDecoration? get decoration => InputDecoration(
        // isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: title,
        labelText: title,
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      );
}
