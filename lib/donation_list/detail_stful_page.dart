import 'package:angel/donation_list/bootpay_flutter.dart';
import 'package:flutter/material.dart';
import 'lesson.dart';

class DetailPageSt extends StatefulWidget {
  final Lesson lesson;

  DetailPageSt({Key key, this.lesson}) : super(key: key);

  @override
  _DetailPageStState createState() => _DetailPageStState();
}

class _DetailPageStState extends State<DetailPageSt> {


  final controller = TextEditingController();

  var _textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${widget.lesson.photo}'),
                        fit: BoxFit.fill,
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(40.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                  BoxDecoration(color: Color.fromRGBO(50, 50, 50, 0.8)),
                  child: Center(
                    child: Column(
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
                          '${widget.lesson.title}',
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
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
                                      '${widget.lesson.level}',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            //Expanded(flex: 1, child: coursePrice)
                          ],
                        ),
                      ],
                    ),
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30.0),

              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      '${widget.lesson.content}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      width: MediaQuery.of(context).size.width,
                    ),
                    ListTile(
                      title: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "기부하실 금액을 입력하세요 (1000원 이상)",
                        ),
                      ),
                    ),
                    ListTile(
                      title: RaisedButton(
                        child: Text("기부하기"),
                        onPressed: (){
                          /*
                          var route = MaterialPageRoute(
                            builder: (BuildContext context) =>Bootpayflutter(value:_textController.text),
                          );
                          Navigator.of(context).push(route);*/
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bootpayflutter(value: _textController.text,lesson: widget.lesson,)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}