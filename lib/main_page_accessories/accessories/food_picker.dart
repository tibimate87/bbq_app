import 'package:bbq_app/constans.dart';
import 'package:flutter/material.dart';

class FoodPicker extends StatelessWidget {
  @override
  FoodPicker(
      {@required this.imageString,
      @required this.foodNameString,
      @required this.heroTagImage,
      @required this.heroTagTitle});

  final String imageString;
  final String foodNameString;
  final String heroTagImage;
  final String heroTagTitle;

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Hero(
            tag: heroTagImage,
            child: Image(
              // width: MediaQuery.of(context).size.width,
              image: AssetImage(imageString),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: heroTagTitle,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        foodNameString,
                        style: kCategoryTitleText,
                      ),
                    ),
                  ),
                ),
                Text(
                  'TAP TO OPEN',
                  style: kCategorySubTitleText,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
