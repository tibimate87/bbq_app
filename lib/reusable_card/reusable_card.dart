import 'package:bbq_app/reusable_card/accessories/card_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bbq_app/constans.dart';
import 'package:bbq_app/single_recepie_page/single_recepie_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.recepieDescription,
      @required this.recepieTitle,
      this.height,
      @required this.heroTag,
      @required this.imageString,
      @required this.titleString});

  final String recepieTitle;
  final String recepieDescription;
  final double height;
  final String heroTag;
  final imageString;
  final titleString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: true,
            pageBuilder: (BuildContext context, _, __) {
              return SingleRecepiePage(
                heroTag: 'card$heroTag',
                imageString: imageString,
                titleString: titleString,
              );
            },
          ),
        );

        // Navigator.pushNamed(context, SingleRecepiePage.ID);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(recepieTitle, style: kCardTitleStyle),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('tibimate87',
                                style: kCardTitleStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                      CardButtons(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                        widgeticon: FontAwesomeIcons.bookmark,
                        onTap: () {
                          //ToDO Firebase Mentés
                          print('Mentve');
                        },
                        // buttonText: 'Mentés',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image(
                              image: AssetImage('images/pulledPork.png'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: recepieDescription,
                                  style: kCardTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CardButtons(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                        widgeticon: FontAwesomeIcons.thumbsUp,
                        buttonText: 'Tetszik (0)',
                        onTap: () {
                          //ToDo
                          print('Tetszik');
                        },
                      ),
                      CardButtons(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                        widgeticon: FontAwesomeIcons.thumbsDown,
                        buttonText: 'Nem Tetszik (0)',
                        onTap: () {
                          //ToDo
                          print('Nem Tetszik');
                        },
                      ),
                      CardButtons(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        widgeticon: FontAwesomeIcons.checkCircle,
                        buttonText: 'Kész (0)',
                        onTap: () {
                          //ToDo
                          print('Megcsináltam');
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
