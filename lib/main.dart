import 'package:bbq_app/main_page_accessories/recepie_page.dart';
import 'package:bbq_app/recepie_list_page/list_main_page.dart';
import 'package:flutter/material.dart';
import 'package:bbq_app/single_recepie_page/single_recepie_page.dart';
import 'trial.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Trial(),
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
