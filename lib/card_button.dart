import 'package:flutter/material.dart';

class CardButtons extends StatelessWidget {
  CardButtons(
      {@required this.alignment,
      @required this.padding,
      @required this.widgeticon,
      @required this.buttonText});

  final IconData widgeticon;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('slkdfj');
      } ,
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
              color: Colors.white,
            ),
          ),
          Container(
            alignment: alignment,
            padding: padding,
            child: Text(buttonText, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
