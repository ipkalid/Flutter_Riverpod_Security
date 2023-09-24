import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget padding({EdgeInsets padding = const EdgeInsets.all(8)}) {
    return Padding(padding: padding, child: this);
  }

  Widget cornerRadius({required BorderRadius borderRadius}) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: this,
    );
  }

  Widget backgroundColor({required Color? color}) {
    return Container(
      color: color,
      child: this,
    );
  }

  Widget frame({double? height, double? width, Alignment alignment = Alignment.center}) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      child: this,
    );
  }

  Widget framed({
    minWidth = 0.0,
    maxWidth = double.infinity,
    minHeight = 0.0,
    maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  Widget onTapGesture({required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Widget shadow({
    Color color = Colors.black,
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    BlurStyle blurStyle = BlurStyle.normal,
  }) {
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: color, offset: offset, blurRadius: blurRadius, spreadRadius: spreadRadius, blurStyle: blurStyle)]),
      child: this,
    );
  }

  Widget border({required BorderSide side, required BorderRadius borderRadius}) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: side,
          borderRadius: borderRadius,
        ),
      ),
      child: this,
    );
  }

  Widget rotate({int degree = 0}) {
    return RotatedBox(
      quarterTurns: degree,
      child: this,
    );
  }
}
