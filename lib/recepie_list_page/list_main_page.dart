import 'package:bbq_app/constans.dart';
import 'package:bbq_app/reusable_card/reusable_card.dart';
import 'package:flutter/material.dart';

class ListMainPage extends StatefulWidget {
  ListMainPage(
      {this.imageString,
      this.titleString,
      this.heroTagImage,
      this.heroTagTitle});
  final imageString;
  final titleString;
  final heroTagImage;
  final heroTagTitle;
  static const String ID = 'list_page';
  @override
  _ListMainPageState createState() => _ListMainPageState();
}

class _ListMainPageState extends State<ListMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: widget.heroTagImage,
              child: Image(
                height: 100.0,
                width: 70.0,
                image: AssetImage(widget.imageString),
              ),
            ),
            Hero(
              tag: widget.heroTagTitle,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  child: Text(
                    widget.titleString,
                    style: kCategoryTitleText.copyWith(
                        fontSize: 25, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: 'container',
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.grey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: ListView(
                  children: <Widget>[
                    ReusableCard(
                      recepieTitle: 'Pulled Pork szendvics',
                      recepieDescription:
                          'Néhány kedvcsináló gondolat a receptről',
                    ),

                  ],
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //       Hero(
          //         tag: widget.heroTagImage,
          //         child: Image(
          //           height: 100.0,
          //           width: 150.0,
          //           image: AssetImage(widget.imageString),
          //         ),
          //       ),
          //       Hero(
          //         tag: widget.heroTagTitle,
          //         child: Material(
          //           color: Colors.transparent,
          //           child: Container(
          //             child: Text(
          //               widget.titleString,
          //               style: kCategoryTitleText.copyWith(fontSize: 35),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
