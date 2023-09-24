import 'package:flutter/material.dart';

class AppColors {
  static var primaryGradinColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [mauve, orange]);

  static var screenBackgroundColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [black, darkBlue]);

  static var mauve = const Color(0xffFD0C92);
  static var orange = const Color(0xffFFAA92);

  static var black = const Color(0xff212338);
  static var darkBlue = const Color(0xff363667);

  static var viewBackgroundColor = const Color(0xff363758);
}
