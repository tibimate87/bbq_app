
import 'package:bbq_app/01_main_page_accessories/recepie_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:bbq_app/timer_page.dart';

List foodNames = ['Beef', 'Pork', 'Poultary', 'seafood'];
int sliderValue = 0;

class CupertinoStoreHomePage extends StatefulWidget {
  static const String ID = 'recepie_page';
  @override
  _CupertinoStoreHomePageState createState() => _CupertinoStoreHomePageState();
}

class _CupertinoStoreHomePageState extends State<CupertinoStoreHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calculator), title: Text('Calculator')),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.fire), title: Text('Woods')),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: RecepiePage(),
                  );
                },
              );
              case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: TimerPage(),
                  );
                },
              );
          }
        });
  }
}
