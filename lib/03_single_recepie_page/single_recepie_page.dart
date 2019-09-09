import 'package:flutter/material.dart';
import 'package:bbq_app/constans.dart';
import 'package:bbq_app/reusable_card/accessories/card_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleRecepiePage extends StatefulWidget {
  static const String ID = 'single_recepie_page';

  SingleRecepiePage(
      {@required this.heroTag,
      @required this.imageString,
      @required this.titleString});
  final heroTag;
  final imageString;
  final titleString;
  @override
  _SingleRecepiePageState createState() => _SingleRecepiePageState();
}

class _SingleRecepiePageState extends State<SingleRecepiePage> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: currentPage, viewportFraction: 1.0, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Row(
            children: <Widget>[
              Image(
                height: 100.0,
                width: 70.0,
                image: AssetImage(widget.imageString),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  child: Text(
                    widget.titleString,
                    style: kCategoryTitleText.copyWith(
                        fontSize: 25, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Hero(
              tag: 'container',
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.grey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            Hero(
              tag: widget.heroTag,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Colors.white70, Colors.white70]),
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Title'),
                          Text('From'),
                          Text('Icon')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
