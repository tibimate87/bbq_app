import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            clipper: DiagonalPathClipperTwo(),
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
                    padding: const EdgeInsets.all(30.0),
                    child: CarouselSlider(
                      height: 100,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {},
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      'text $i',
                                      style: TextStyle(
                                        fontSize: 80.0,
                                      ),
                                    ),
                                  )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                  // Row(
                  //   children: <Widget>[
                  ,
                  // IconWidgets(
                  //     widgeticon: FontAwesomeIcons.arrowLeft,
                  //     paddingData: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //     alignmentData: Alignment.center,
                  //     size: 30.0),
                  //   ],
                  // ),
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
                  child: Container(
                    color: Colors.lime,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 20.0,),
                Card(
                  child: Container(
                    color: Colors.lime,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 20.0,),
                Card(
                  child: Container(
                    color: Colors.lime,
                    height: 150.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
