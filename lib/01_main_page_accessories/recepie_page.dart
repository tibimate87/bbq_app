import 'package:bbq_app/01_main_page_accessories/accessories/food_picker.dart';
import 'package:bbq_app/02_recepie_list_page/list_main_page.dart';
import 'package:bbq_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List foodNames = ['Hamburger', 'Pork'];
int sliderValue = 0;

class RecepiePage extends StatefulWidget {
  static const String ID = 'recepie_page';
  @override
  _RecepiePageState createState() => _RecepiePageState();
}

class _RecepiePageState extends State<RecepiePage> {
    // with SingleTickerProviderStateMixin {
  PageController _pageController;
  int currentPage = 0;
  String heroTagImage = 'image';
  String heroTagTitle = 'title';
  List foodImageList = ['images/hamburger.png', 'images/pulledPork.png'];
  List foodDescList = ['HAMBURGER', 'PORK'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: currentPage, viewportFraction: 1.0, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          leading: Icon(FontAwesomeIcons.gripLines),
        ),
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Text(
                  'BBQ app',
                  style: kMainTitleTextStyle,
                ),
              ),
              new ListTile(
                title: new Text(
                  'Profilom',
                  style: kMainSubTitleTextStyle,
                ),
                onTap: () {},
              ),
              new ListTile(
                title: new Text(
                  'Beállítások',
                  style: kMainSubTitleTextStyle,
                ),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  'Kijelentkezés',
                  style: kMainSubTitleTextStyle,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'BBQ Recipes',
                      style: kMainTitleTextStyle,
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Share and collect recepies form each other',
                      style: kMainSubTitleTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: 'container',
                  child: Container(
                    height: screenHeight * 0.45,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.grey],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onVerticalDragStart: (value) {
                // onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: true,
                    pageBuilder: (BuildContext context, _, __) {
                      return ListMainPage(
                          titleString: foodDescList[currentPage],
                          imageString: foodImageList[currentPage],
                          heroTagImage: heroTagImage + '$currentPage',
                          heroTagTitle: heroTagTitle + '$currentPage');
                    },
                  ),
                );
              },
              child: PageView(
                onPageChanged: (value) {
                  currentPage = value;
                  print(currentPage);
                },
                controller: _pageController,
                children: <Widget>[
                  for (var i = 0; i < foodDescList.length; i++)
                    FoodPicker(
                      heroTagTitle: heroTagTitle + '$i',
                      heroTagImage: heroTagImage + '$i',
                      foodNameString: foodDescList[i],
                      imageString: foodImageList[i],
                    )
                ],
              ),
            ),
            //ToDO Get number of cards from Firebase
            for (var i = 0; i < 2; i++) Hero(tag: 'card$i', child: Container()),
          ],
        ),
      ),
    );
  }
}
