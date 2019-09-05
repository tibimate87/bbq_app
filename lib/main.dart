import 'package:bbq_app/cupertino_controller.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoStoreHomePage(),
      // initialRoute: RecepiePage.ID,
      // routes: {
      //   RecepiePage.ID: (context) => RecepiePage(),
      //   ListMainPage.ID: (context) => ListMainPage(),
      //   // SingleRecepiePage.ID: (context) => SingleRecepiePage(),
      // },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.white12,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.grey, size: 40))),
    );
  }
}
