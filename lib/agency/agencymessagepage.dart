import 'package:flutter/material.dart';

class AgencyMessagePage extends StatefulWidget {
  @override
  _AMessageState createState() => _AMessageState();
}

class _AMessageState extends State<AgencyMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          //child: Category(),
          ),
      appBar: AppBar(
        title: Text(
          "Message",
        ),
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return ListView.builder(
    itemCount: 5, ////////////////////////////////////동적할때 바꾸기
    itemBuilder: (context, index) {
      return _buildListItem(context, index);
    },
  );
}

Widget _buildListItem(BuildContext context, int index) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 5, right: 10, left: 10),
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/1.jpg"),
            ),
            Container(
              child: Text(
                /////////사용자이름
                "최희선",
              ),
              margin: EdgeInsets.only(
                top: 5,
              ),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey,
          ),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Text(
              /////////////////////////text
              " 최희선님이 기부천사 단체에 50,000원을 기부하셨습니다. \n"
              " 지금까지 모은 돈은 100,000원 입니다. \n"
              " 좋은 하루 보내세요~ ",
            ),
          ),
        ),
      ],
    ),
  );
}
