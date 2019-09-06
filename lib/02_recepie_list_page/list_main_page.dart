import 'package:bbq_app/constans.dart';
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

class _ListMainPageState extends State<ListMainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  bool _visible = true;
  double calculatedTemp;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(microseconds: 1), vsync: this);

    animation = SizeTween(begin: Size.fromHeight(200), end: Size.fromHeight(0))
        .animate(controller);
    // ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Row(
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _visible = false;
                  });
                },
              );
            },
          ),
        ),
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: 'container',
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.grey],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Smoker temperature:', style: kTitleText,),
                                  Text('225°F',style: kNumberTextStyle,),
                                ],
                              ),
                              
                              Column(
                                children: <Widget>[
                                  Text('Time:', style: kTitleText,),
                                  Text('1hr/lb unwrapped + 1hr/lb wrapped',style: kNumberTextStyle.copyWith(fontSize: 20),),
                                ],
                              ),
                              
                              Column(children: <Widget>[
                                TextField(onChanged: (value) {
                                    setState(() {
                                      calculatedTemp = double.parse(value)*2;
                                    });
                                },),
                                Text('$calculatedTemp'),
                              ],),

                              Column(
                                children: <Widget>[
                                  Text('Internal temperature', style: kTitleText,),
                                  Text('190-200°F',style: kNumberTextStyle,),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                  ),
                  // Visibility(
                  //   visible: _visible,
                  //   child: Container(
                  //     child: ListView(
                  //       children: <Widget>[],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
