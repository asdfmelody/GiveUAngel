import 'package:flutter/material.dart';

void main() => runApp(PiggyBankOngoingPage());

class PiggyBankOngoingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                ),
              ),
              Text(
                "진행중인 기부단체",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 380.0,
                child: Image.network(
                    'http://post.phinf.naver.net/20160126_289/1453792810768A2aEY_JPEG/129_film1982.jpg/IAHfmE9cCXb1lnyYgZMJDqmyh5gg.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
