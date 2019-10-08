import 'package:flutter/material.dart';
import 'package:angel/loginpage.dart';
import '../category.dart';

class StarsPage extends StatelessWidget {

  final UserDetails detailsUser;

  StarsPage(this.detailsUser);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Constellation'),
        ),

        drawer: Drawer(
          child: Category(detailsUser),
        ),
        body: Padding(

          padding: EdgeInsets.all(8.0),
          child: CustomPaint(

            painter: ShapesPainter(),
            child: Container(
              height: 700,
            ),

          ),


        ),

      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  int money = 2000000;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.black;

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
    paint.color = Colors.yellow;

    var path = Path();

    canvas.drawPath(path, paint);

    paint.color = Colors.yellow;


    if (money > 10) {
      //canvas.drawCircle(new Offset(100.0, 200.0), 5.0, paint);
      canvas.drawLine(new Offset(75.0, 360.0), new Offset(65.0, 395.0), paint);
      canvas.drawCircle(new Offset(65.0, 395.0), 5.0, paint);
    }
    if (money > 20) {
      canvas.drawLine(new Offset(60.0, 280.0), new Offset(75.0, 360.0), paint);
      canvas.drawCircle(new Offset(75.0, 360.0), 5.0, paint);
    }
    if (money > 30) {
      canvas.drawLine(new Offset(10.0, 270.0), new Offset(60.0, 280.0), paint);
      canvas.drawCircle(new Offset(60.0, 280.0), 5.0, paint);
    }
    if (money > 50) {
      canvas.drawLine(new Offset(10.0, 270.0), new Offset(100.0, 200.0), paint);
      canvas.drawCircle(new Offset(10.0, 270.0), 5.0, paint);
    }
    if (money > 70) {
      canvas.drawCircle(new Offset(100.0, 200.0), 5.0, paint);
      canvas.drawLine(
          new Offset(100.0, 200.0), new Offset(130.0, 200.0), paint);
      canvas.drawCircle(new Offset(130.0, 200.0), 5.0, paint);
    }
    if (money > 150) {
      canvas.drawLine(
          new Offset(130.0, 200.0), new Offset(150.0, 180.0), paint);
      canvas.drawCircle(new Offset(150.0, 180.0), 5.0, paint);
    }
    if (money > 170) {
      canvas.drawLine(
          new Offset(130.0, 200.0), new Offset(170.0, 220.0), paint);
      canvas.drawCircle(new Offset(170.0, 220.0), 5.0, paint);
    }
    if (money > 190) {
      canvas.drawLine(
          new Offset(170.0, 220.0), new Offset(140.0, 295.0), paint);
      canvas.drawCircle(new Offset(140.0, 295.0), 5.0, paint);
    }
    if (money > 200) {
      canvas.drawLine(
          new Offset(140.0, 295.0), new Offset(160.0, 385.0), paint);
      canvas.drawCircle(new Offset(160.0, 395.0), 5.0, paint);
    }
    if (money > 300) {
      canvas.drawLine(
          new Offset(170.0, 220.0), new Offset(260.0, 285.0), paint);
      canvas.drawCircle(new Offset(260.0, 285.0), 5.0, paint);
    }
    if (money > 10000) {
      canvas.drawLine(
          new Offset(260.0, 285.0), new Offset(365.0, 335.0), paint);
      canvas.drawCircle(new Offset(365.0, 335.0), 5.0, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}