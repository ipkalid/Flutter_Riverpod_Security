import 'package:flutter/material.dart';
import 'package:sport_app/core/style/app_colors.dart';

class _BackgroundColor extends StatelessWidget {
  const _BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.constrainHeight();
      final width = constraints.constrainHeight();
      return Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            decoration:
                BoxDecoration(gradient: AppColors.screenBackgroundColor),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.15),
            child: Container(
              width: width / 3,
              height: height / 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x70ff34c6),
                      blurRadius: 135,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x50FFC6AA),
                      blurRadius: 135,
                      spreadRadius: 0,
                    )
                  ]),
            ),
          ),
        ],
      );
    });
  }
}

extension BackgroundColorWidgetExtensions on Widget {
  Widget backgroundColor() {
    return Stack(
      children: [const _BackgroundColor(), this],
    );
  }
}

class _PrimaryBackgroundColor extends StatelessWidget {
  const _PrimaryBackgroundColor({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradinColor,
      ),
      child: child,
    );
  }
}

extension PrimaryBackgroundColorWidgetExtensions on Widget {
  Widget primaryBackgroundColor() {
    return _PrimaryBackgroundColor(
      child: this,
    );
  }
}
