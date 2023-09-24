import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ColumnWithSpacing extends Column {
  const ColumnWithSpacing({
    super.key,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.children,
    super.textBaseline,
    super.textDirection,
    super.mainAxisAlignment,
    super.verticalDirection,
    this.spacing = 16,
    this.addSpacer = false,
  });
  final int spacing;
  final bool addSpacer;

  @override
  List<Widget> get children => _newChildren();
  // .children
  // .map(
  //   (e) => Padding(
  //     padding: EdgeInsets.symmetric(vertical: addSpacer ? spacing / 3 : spacing / 2),
  //     child: Column(
  //       children: [
  //         e,
  //         if (addSpacer)
  //           SizedBox(
  //             height: spacing / 3,
  //           ),
  //         if (addSpacer)
  //           Divider(
  //             color: Colors.black12,
  //           )
  //       ],
  //     ),
  //   ),
  // )
  // .toList();

  List<Widget> _newChildren() {
    final length = super.children.length;
    return super
        .children
        .mapIndexed(
          (i, e) => Padding(
            padding: EdgeInsets.symmetric(vertical: addSpacer ? spacing / 3 : spacing / 2),
            child: Column(
              children: [
                e,
                if (addSpacer)
                  SizedBox(
                    height: spacing / 3,
                  ),
                if (addSpacer && (length - 1) != i)
                  Divider(
                    color: Colors.black12,
                  )
              ],
            ),
          ),
        )
        .toList();
  }
}

class RowWithSpacing extends Row {
  const RowWithSpacing({
    super.key,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.children,
    super.textBaseline,
    super.textDirection,
    super.mainAxisAlignment,
    super.verticalDirection,
    this.spacing = 16,
    this.addSpacer = false,
  });
  final int spacing;
  final bool addSpacer;
  @override
  List<Widget> get children => super.children.map((e) => Padding(padding: EdgeInsets.symmetric(horizontal: spacing / 2), child: e)).toList();
}
