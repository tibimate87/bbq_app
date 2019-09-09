import 'package:bbq_app/reusable_card/accessories/card_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bbq_app/constans.dart';
import 'package:bbq_app/bbq_brain.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.recepieTitle,
      this.height,
      @required this.heroTag,
      @required this.imageString,
      @required this.onTapPlus,
      @required this.onTapMinus,
      @required this.titleString,
      @required this.weight,
      @required this.hours});

  final String recepieTitle;

  final double height;
  final int heroTag;
  final imageString;
  final titleString;
  final Function onTapPlus;
  final Function onTapMinus;
  final double weight;
  final double hours;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     opaque: true,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return SingleRecepiePage(
        //         heroTag: 'card$heroTag',
        //         imageString: imageString,
        //         titleString: titleString,
        //       );
        //     },
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 10,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: 'card$heroTag',
                child: Container(
                  height: height == null ? 200.0 : height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Colors.white70, Colors.white70]),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(recepieTitle, style: kCardTitleStyle),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage('images/pulledPork.png'),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '$weight',
                                style: kCardTextStyle.copyWith(fontSize: 30),
                              ),
                              Text(
                                'lb',
                                style: kCardTextStyle.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('$hours',
                                  style: kCardTextStyle.copyWith(fontSize: 30)),
                              Text(
                                'Hours',
                                style: kCardTextStyle.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CardButtons(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 5),
                        widgeticon: FontAwesomeIcons.minusCircle,
                        size: 40,
                        onTap: () {
                          onTapMinus();
                        },
                      ),
                      CardButtons(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                        widgeticon: FontAwesomeIcons.plusCircle,
                        size: 40,
                        onTap: () {
                          onTapPlus();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
