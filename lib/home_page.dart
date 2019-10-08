import 'package:angel/category.dart';
import 'package:angel/tab/homepage/list_view.dart';
import 'package:angel/tab/homepage/my_location.dart';
import 'package:angel/tab/homepage/ongoing_donation.dart';
import 'package:flutter/material.dart';
import 'tab/homepage/Carousel.dart';
import 'category.dart';
import 'loginpage.dart';

class HomePage extends StatelessWidget {

  final UserDetails detailsUser;

  HomePage(this.detailsUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Category(detailsUser),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '기부천사',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Carousel(),
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          OngoingDonation(),
          //ListViewCard(),
          //MyLocation(),
        ],
      ),
    );
  }
}
