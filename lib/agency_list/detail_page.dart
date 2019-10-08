import 'package:angel/agency_list/lesson.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final Lesson lesson;

  DetailPage({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    /*final coursePrice = Container(
      padding: const EdgeInsets.all(10.0),
       decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$" + lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );*/

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*SizedBox(height: 120.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),*/
        /*Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),*/
        SizedBox(height: 20.0),
        Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize:30.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level,
                      style: TextStyle(color: Colors.white),
                    ))),
            //Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: new BoxDecoration(
              image:  DecorationImage(
                image: NetworkImage(lesson.photo),
                fit: BoxFit.fill,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(50, 50, 50, 0.8)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      lesson.content,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {
//예진이.홈페이지 링크 추가
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("홈페이지로 가기", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}