import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'card_button.dart';
class RecepiePage extends StatefulWidget {
  @override
  _RecepiePageState createState() => _RecepiePageState();
}

class _RecepiePageState extends State<RecepiePage> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconWidgets(
                        widgeticon: FontAwesomeIcons.portrait,
                        paddingData: EdgeInsets.fromLTRB(20, 50, 0, 0),
                        alignmentData: Alignment.topLeft,
                        size: 40.0,
                      ),
                      IconWidgets(
                        widgeticon: FontAwesomeIcons.clock,
                        paddingData: EdgeInsets.fromLTRB(0, 50, 20, 0),
                        alignmentData: Alignment.topRight,
                        size: 40.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                    child: CarouselSlider(
                      height: 150,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {},
                      items: [Image(image: AssetImage('images/trialPics3.png'))]
                          .map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: i,
                                  )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              children: <Widget>[
                Card(
                  elevation: 10,
                  color: Colors.transparent,
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CardButtons(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          widgeticon: FontAwesomeIcons.thumbsUp,
                          buttonText: 'Tetszik (0)',
                         
                        ),
                        CardButtons(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          widgeticon: FontAwesomeIcons.checkCircle,
                          buttonText: 'Megcsináltam (0)',
                          
                        ),
                        CardButtons(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                          widgeticon: FontAwesomeIcons.bookmark,
                          buttonText: 'Mentés',
                          
                        ),
                        // IconWidgets(
                        //   widgeticon: FontAwesomeIcons.checkCircle,
                        //   paddingData: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   alignmentData: Alignment.bottomCenter,
                        //   size: 30.0,
                        // ),
                        // IconWidgets(
                        //   widgeticon: FontAwesomeIcons.bookmark,
                        //   paddingData: EdgeInsets.fromLTRB(0, 0, 20.0, 10),
                        //   alignmentData: Alignment.bottomRight,
                        //   size: 30.0,
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


