import 'package:flutter/cupertino.dart';

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    required this.child,
    required this.title,
    this.style,
    this.padding = EdgeInsets.zero,
  });
  final Widget child;
  final String title;
  final TextStyle? style;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(title, style: style),
        ),
        const SizedBox(
          height: 8,
        ),
        child,
      ],
    );
  }
}

extension ItemTitleWidgetExtensions on Widget {
  Widget itemTitle(String title,
      {TextStyle? style, EdgeInsets padding = EdgeInsets.zero}) {
    return _ItemTitle(
      title: title,
      style: style,
      padding: padding,
      child: this,
    );
  }
}
