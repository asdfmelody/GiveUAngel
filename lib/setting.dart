//왼쪽 정렬


import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('설정',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
      }),
      ),
      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    bool _value = false;
    void _onChange(bool value) {
      setState((){
        _value = value;
      });
    }
    return SingleChildScrollView(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Text('프로필 및 계정',style: TextStyle(fontSize: 18.0,color: Colors.grey)),

          Padding(padding: EdgeInsets.all(8.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('로그인 정보',style: TextStyle(fontSize: 18.0),),
              Text('1234@naver.com',style: TextStyle(fontSize: 18.0)), //이메일 받아와야함
            ],),
          Container(
            width: 400.0,
            height: 0.5,
            color: Colors.black54,
            margin: EdgeInsets.only(top: 4.0),
          ),
          Text('서비스 계정',style: TextStyle(fontSize: 18.0,color: Colors.grey)),
          Padding(padding: EdgeInsets.all(8.0)),
          SwitchListTile(
            title: Text('알림 ',style: TextStyle(fontSize: 18.0),),
              activeColor: Colors.yellow,
              secondary: const Icon(Icons.alarm),
              value:_value,
              onChanged: (bool value){_onChange(value);}),
          SwitchListTile(
              title: Text('위치 서비스',style: TextStyle(fontSize: 18.0),),
              activeColor: Colors.yellow,
              secondary: const Icon(Icons.gps_fixed),
              value:_value,
              onChanged: (bool value){_onChange(value);}),
          SwitchListTile(
              title: Text('그냥 만들어봄',style: TextStyle(fontSize: 18.0),),
              activeColor: Colors.yellow,
              secondary: const Icon(Icons.alarm),
              value:_value,
              onChanged: (bool value){_onChange(value);}),
          Container(
            width: 400.0,
            height: 0.5,
            color: Colors.black54,
            margin: EdgeInsets.only(top: 4.0),
          ),
          Text('고객지원',style: TextStyle(fontSize: 18.0,color: Colors.grey)),
          Padding(padding: EdgeInsets.all(8.0)),
         Row(
           children: <Widget>[
             Text("공지 사항",style: TextStyle(fontSize: 18.0),), //클릭 가능하게
           ],
         ),
          Padding(padding: EdgeInsets.all(8.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('버전',style: TextStyle(fontSize: 18.0),),
              Text('1.0',style: TextStyle(fontSize: 18.0)),
            ],),
          ListTile(
              leading: Icon(Icons.power_settings_new),
              title: new Text("Logout",style: TextStyle(fontSize: 18.0),),
              onTap: () {
                //Navigator.pop(context);
              }),
        ],
      ),
    );
  }
  }