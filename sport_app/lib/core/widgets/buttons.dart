// MaterialButton(
//                       onPressed: () {},
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(80.0)),
//                       padding: const EdgeInsets.all(0.0),
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: AppColors.primaryGradinColor,
//                           borderRadius: BorderRadius.all(Radius.circular(80.0)),
//                         ),
//                         child: Container(
//                           constraints: const BoxConstraints(
//                               minWidth: 88.0,
//                               minHeight:
//                                   36.0), // min sizes for Material buttons
//                           alignment: Alignment.center,
//                           child: const Text(
//                             'OK',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),

import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class PrimaryButton extends MaterialButton {
  final Widget childBody;
  const PrimaryButton({
    super.key,
    required this.childBody,
    required super.onPressed,
  });

  @override
  ShapeBorder get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  EdgeInsetsGeometry? get padding => EdgeInsets.zero;

  @override
  Widget? get child => Ink(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradinColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ),
          alignment: Alignment.center,
          child: childBody,
        ),
      );
}
