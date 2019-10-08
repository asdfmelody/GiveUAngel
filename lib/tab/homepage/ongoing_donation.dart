import 'package:flutter/material.dart';

class OngoingDonation extends StatelessWidget {

  final Card = Container(
    height: 150.0,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),

      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          offset: new Offset(0.0, 5.0),
        ),
      ],

    ),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Text('현재 진행 중인 기부',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),), //위치 변경
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('1. ',style: TextStyle(fontSize: 20.0),),
              Text('세이브 더 칠드런',style: TextStyle(fontSize: 20.0),), //나중에 변경
              Padding(padding: EdgeInsets.all(4.0)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('2. ',style: TextStyle(fontSize: 20.0),),
              Text('유니세프',style: TextStyle(fontSize: 20.0),), //나중에 변경
              Padding(padding: EdgeInsets.all(4.0)),
            ],
          ),

        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Card,

    );
  }
}
