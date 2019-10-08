import 'package:angel/category.dart';
import 'package:angel/donation_list/lesson.dart';
import 'package:flutter/material.dart';
import 'package:angel/loginpage.dart';
import 'package:bootpay_flutter/bootpay_flutter.dart';

//기부횟수, 기부단체, 기부금액, 기부단체사진

class MessagePage extends StatefulWidget {

  final UserDetails detailsUser;
  final Lesson lesson; //단체이름, 단체사진
  final String value; //기부금액

  MessagePage(this.detailsUser, this.lesson, this.value);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(
       child: Category(widget.detailsUser),
     ),
      appBar: AppBar(
        title: Text(
          "Message",
        ),

      ),
      body:_buildBody(),

    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: 1, //
      itemBuilder: (context,index){
        return _buildListItem(context, index);
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, right: 10,left: 10),
      child: Row(

        children: <Widget>[
          Column(
            children: <Widget>[

              CircleAvatar(
                backgroundImage: NetworkImage('${widget.lesson.photo}'),
              ),

              Container(
                margin: EdgeInsets.only(top:5,),
              )
            ],
          ),

          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              ),
              color: Colors.grey,
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              child:
              Text( /////////////////////////text
                  "기부천사에 후원해 주셔서 감사합니다. \n"
                      " 남은 돈은 ${widget.value}원 입니다. \n"
                      " 좋은 하루 보내세요~ "
              ),
            ),
          ),
        ],
      ),
    );
  }


}

