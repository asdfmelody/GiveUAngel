import 'package:flutter/material.dart';
import 'package:angel/root_page.dart';
import 'tab_page.dart';
import 'loginpage.dart';
import 'join_page.dart';
import 'widgets/formcard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        accentColor: Colors.black
        /*
        primaryColor: Color(0xFF2196f3),
        accentColor: Color(0xFF2196f3),
        canvasColor: Color(0xFFfafafa),
        */
      ),
      home: LoginPage()//yTabPage(),//MyTabPage()////,

    );
  }
}
