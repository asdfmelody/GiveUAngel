import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


String _validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}

String _validatePassword(String value) {
  return value.length < 5 ? 'Min 6 char required' : null;
}

String _validateConfirmPassword(String value) {
  return value.length < 5 ? 'Min 6 char required' : null;
}

class JoinPage extends StatefulWidget {
  JoinPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<JoinPage> {
  final DatabaseReference database =
  FirebaseDatabase.instance.reference().child("test");

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  int groupValue=0;
  String belongTo;
  //여기부터
  String _username;
  String _email;
  String   _password;
  final formkey=new GlobalKey<FormState>();
  checkFields(){
    final form=formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }



  createUser()async{
    if (checkFields()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user){
        print('signed in as ${user.uid}');

        Navigator.of(context).pop();
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new LoginPage(),
            ));

        database.push().set({
          'name' : _username,
          //'email' : _email,
          'password' : _password,
        });
      }).catchError((e){
        print(e);
      });
    }
  }



  void _handleRadioValueChange(int value) {
    setState(() {
      groupValue = value;
      switch (groupValue) {
        case 0:
          belongTo = '개인';
          break;
        case 1:
          belongTo = '단체';
          break;
      }
    });
  }

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
//                getWidgetImageLogo(),
                getWidgetRegistration(),
              ],
            )),
      ),
    );
  }

  Widget getWidgetImageLogo() {
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 32),
          child: Icon(Icons.ac_unit),
        ));
  }

  Widget getWidgetRegistration() {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
//                        title: const Text('개인'),
                      value: 0,
                      groupValue: groupValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('개인'),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                    ),
                    new Radio(
//                        title: const Text('단체'),
                      value: 1,
                      groupValue: groupValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('단체'),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: double.infinity,
//                  child: Text(
//                    'Register',
//                    style: TextStyle(
//                        fontSize: 18.0, color: Colors.black),
//                  ),
              ), // title: login
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'username',
                    icon: Icon(Icons.perm_identity),

                  ),
                  obscureText: false,
                  validator: (value)=>
                  value.isEmpty ? "required name": null,
                  onSaved: (value) => _username = value ,
                ),
              ), //text field : user name
              Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      labelText: 'Email',
                      icon: Icon(Icons.email),

                    ),
                    obscureText: false,
                    validator: _validateEmail,
                    onSaved: (value) => _email = value ,
                  )
              ), //text field: email
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      labelText: 'password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      icon: Icon(Icons.vpn_key)
                  ),
                  obscureText: false,
                  validator: _validatePassword,
                  onSaved: (value) => _password = value ,
                ),
              ), //text field: password
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter your password again',
                      labelText: 'password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      icon: Icon(Icons.vpn_key)
                  ),
                  obscureText: false,
                  validator: _validateConfirmPassword,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32.0),
                width: double.infinity,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  elevation: 5.0,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: createUser,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ), //button: login
              Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already Register? ',
                      ),
                      InkWell(
//                          splashColor: AppColors.colorAccent.withOpacity(0.5),
                        onTap: () {
                          Route route =
                          MaterialPageRoute(builder: (context) => LoginPage());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(
//                                color: AppColors.colorAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
