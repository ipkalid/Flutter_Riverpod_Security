import 'package:flutter/cupertino.dart';

class _ViewBackground extends StatelessWidget {
  const _ViewBackground({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff363758),
      ),
      child: child,
    );
  }
}

extension ViewBackgroundWidgetExtensions on Widget {
  Widget viewBackground() {
    return _ViewBackground(child: this);
  }
}
