import 'package:bbq_app/constans.dart';
import 'package:flutter/material.dart';

class CardButtons extends StatelessWidget {
  CardButtons(
      {@required this.alignment,
      @required this.padding,
      @required this.widgeticon,
      this.buttonText,
      @required this.onTap});

  final IconData widgeticon;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Function onTap;

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: alignment,
            padding: padding,
            child: Icon(
              widgeticon,
              size: 20,
              color: Colors.red,
            ),
          ),
          if (buttonText != null)
            Container(
              alignment: alignment,
              padding: padding,
              child: Text(buttonText, style: kCardTextStyle),
            ),
        ],
      ),
    );
  }
}
