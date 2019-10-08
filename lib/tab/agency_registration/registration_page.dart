// 기관 등록
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final telController = TextEditingController();
  final localController = TextEditingController();
  File _image;

  @override
  void dispose(){ //소멸될 때 불리는 것
    nameController.dispose();
    emailController.dispose();
    telController.dispose();
    localController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('기관 등록',
        style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold ),
      ),
      actions : <Widget>[
        IconButton(
          icon: Icon(Icons.send), onPressed: (){
        },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child:Column(
          children: <Widget>[
            _image == null ? Text('기관 사진을 등록해주세요',style: TextStyle(fontSize: 18.0),) : Image.file(_image),
            TextField(
              
              decoration: InputDecoration(
            labelText : '기관이름',
            labelStyle : TextStyle(color: Colors.blue,fontSize: 18.0),
              ),
              controller: nameController ,
            ),
            TextField(
              decoration: InputDecoration(
                labelText : '기관 이메일',
                labelStyle : TextStyle(color: Colors.blue,fontSize: 18.0),),
              controller: emailController ,
            ),
            TextField(
              decoration: InputDecoration(
                labelText : '기관 전화번호',
                labelStyle : TextStyle(color: Colors.blue,fontSize: 18.0),),
              controller: telController ,
            ),
            TextField(
              decoration: InputDecoration(
                labelText : '기관 주소',
                labelStyle : TextStyle(color: Colors.blue,fontSize: 18.0),),
              controller: localController ,
            )
          ],
        ));
  }

  Future _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
