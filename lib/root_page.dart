import 'package:angel/loginpage.dart';
import 'package:angel/tab_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root Page'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Route route =
                MaterialPageRoute(builder: (context) => LoginPage());
                Navigator.push(context, route);
              },
              child: Text('Login Page'),
            ),
            RaisedButton(
              onPressed: () {
                Route route =
                MaterialPageRoute(builder: (context) => MyTabPage());
                Navigator.push(context, route);
              },
              child: Text('Tab Page'),
            ),
          ],
        ),
      ),
    );
  }
}
