import 'package:flutter/material.dart';

class IconWidgets extends StatelessWidget {
  IconWidgets(
      {@required this.widgeticon,
      @required this.paddingData,
      this.alignmentData,
      this.size});

  final IconData widgeticon;
  final EdgeInsetsGeometry paddingData;
  final AlignmentGeometry alignmentData;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: alignmentData,
        padding: paddingData,
        child: Icon(
          widgeticon,
          size: size == null ? 50.0 : size,
          color: Colors.red,
        ),
      ),
    );
  }
}
