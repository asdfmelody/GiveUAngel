
import 'package:angel/home_page.dart';
import 'package:angel/tab/message_page.dart';
import 'package:angel/tab/nearlist.dart';
import 'package:angel/tab/piggybank/piggybank_page.dart';
import 'package:angel/tab/stars.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'agency/agencymessagepage.dart';
import 'package:angel/donation_list/lesson.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Tab Page',
      //category
    );
  }
}

class MyTabPage extends StatefulWidget {
  final UserDetails detailsUser;
  final Lesson lesson;

  String donationPrice; //기부금액
  //final UserDetails details;

  MyTabPage({Key key, @required this.detailsUser,this.lesson}) : super(key: key);

  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> {
  int _selectedPage=0;
  List _pageOptions;

  @override
  void initState() {
    super.initState();
    _pageOptions=[
      HomePage(widget.detailsUser),
      MessagePage(widget.detailsUser, widget.lesson, widget.donationPrice),
      NearlistPage(),
      MyPiggyBankPage(widget.detailsUser),
      StarsPage(widget.detailsUser),
    ];
  }

  @override
  Widget build(BuildContext context) {

    bool a = true; // true 사용자, false 단체

    return Scaffold(
      body: _pageOptions[_selectedPage],

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Message'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            title: Text('Surroundings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Piggy Bank'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text('Stars'),
          )
        ],
      ),
    );
  }
}
