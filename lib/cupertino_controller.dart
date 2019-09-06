
import 'package:bbq_app/01_main_page_accessories/recepie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bbq_app/timer_page.dart';

List foodNames = ['Hamburger', 'Pork'];
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
                icon: Icon(Icons.home), title: Text('Receptek')),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer), title: Text('Időzítő')),
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
