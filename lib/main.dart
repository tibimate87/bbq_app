import 'package:bbq_app/main_page_accessories/recepie_page.dart';
import 'package:bbq_app/recepie_list_page/list_main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RecepiePage.ID,
      routes: {
        RecepiePage.ID: (context) => RecepiePage(),
        ListMainPage.ID: (context) => ListMainPage(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.white12,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.grey, size: 40))),
    );
  }
}
