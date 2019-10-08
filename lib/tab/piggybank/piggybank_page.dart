
import 'package:angel/category.dart';

import 'package:flutter/material.dart';
import 'package:angel/loginpage.dart';
//import 'package:dots_indicator/dots_indicator.dart';
/*
void main() {
  runApp(MaterialApp(
    title: 'UI of Amazon Prime Video',
    debugShowCheckedModeBanner: false,
    home: MyPiggyBankPage(),
  ));
}
*/
//ONLY UI Design

class MyPiggyBankPage extends StatefulWidget {
  final UserDetails detailsUser;

  MyPiggyBankPage(this.detailsUser);

  @override
  _MyPiggyBankPageState createState() => _MyPiggyBankPageState();
}

int photoindex = 0;

List<String> photos = [
  'assets/1.jpg',
  'assets/2.jpg',
  'assets/3.jpg',
  'assets/4.jpg',
  'assets/5.jpg',
  'assets/6.jpg',
];

List<String> photosM = [
  'assets/1.jpg',
  'assets/2.jpg',
  'assets/3.jpg',
  'assets/4.jpg',
  'assets/5.jpg',
  'assets/6.jpg',
];

class _MyPiggyBankPageState extends State<MyPiggyBankPage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Drawer(child: Category(widget.detailsUser),),
          appBar: AppBar(
            elevation: 0.0,
            title: Text('저금통'),
            /*

            actions: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '기부천사',
                  ),
                ],
              ),
            ],

            */

          ),
          /*
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0.0,
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'prime',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  Text(
                    ' video',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  )
                ],
              ),

              IconButton(
                  onPressed: () {
                    debugPrint('Search button tapped');
                  },
                  icon: Icon(
                    Icons.search,
                    size: 35,
                  ))
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'TV Shows',
                ),
                Tab(
                  text: 'Movies',
                ),
                Tab(
                  text: 'Kids',
                ),
              ],
            ),
          ),

          */
          //backgroundColor: Colors.black,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        10.0, 10.0, 0.0, 10.0),
                    child: Text(
                      '진행중인 저금통',
                      style: TextStyle(
                        //color: Colors.white,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 220.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  photos[photoindex],
                                ),
                                fit: BoxFit.fill
                              //already i have downloaded some pic
                            )),
                      ),
                      Positioned(
                        top: 180.0,
                        left: 150.0,
                        child: Row(
                          children: <Widget>[],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                            height: 230.0,
                            //color: Colors.grey[900],
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 10.0),
                                      child: Text(
                                        '인기중인 저금통',
                                        style: TextStyle(
                                          //color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    InkWell(
                                      child: Text(
                                        'See more',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 18.0),
                                      ),
                                      onTap: () {
                                        debugPrint('See More...');
                                      },
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 180.0,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: photosM.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            width: 140.0,
                                            child: Card(
                                              child: Image.asset(photosM[index],
                                                  fit: BoxFit.fill),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
