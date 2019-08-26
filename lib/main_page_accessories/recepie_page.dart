import 'package:bbq_app/constans.dart';
import 'package:bbq_app/main_page_accessories/accessories/food_picker.dart';
import 'package:bbq_app/recepie_list_page/list_main_page.dart';
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

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: Icon(FontAwesomeIcons.portrait),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(FontAwesomeIcons.clock),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'BBQ Recepies',
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
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: true,
                  pageBuilder: (BuildContext context, _, __) {
                    return ListMainPage(
                      titleString: foodDescList[currentPage],
                      imageString: foodImageList[currentPage],
                      heroTagImage: heroTagImage + '$currentPage',
                      heroTagTitle: heroTagTitle + '$currentPage'
                    );
                  },
                ),
              );
              // Navigator.pushNamed(context, ListMainPage.ID);
            },
            child: PageView(
             
              onPageChanged: (value)  {
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
        ],
      ),
    );
  }
}

// CarouselSlider(
//               viewportFraction: 0.9,
//               height: screenHeight * 0.8,
//               scrollDirection: Axis.horizontal,
//               onPageChanged: (value) {
//                 print(value);
//                 setState(() {
//                   sliderValue = value;
//                 });
//               },
//               items: [
//                 FoodPicker(
//                     imageString: 'images/hamburger.png',
//                     foodNameString: 'HAMBURGER'),
//                 FoodPicker(
//                     imageString: 'images/pulledPork.png',
//                     foodNameString: 'PORK'),
//               ].map((i) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(color: Colors.transparent),
//                         child: i);
//                   },
//                 );
//               }).toList(),
//             )
