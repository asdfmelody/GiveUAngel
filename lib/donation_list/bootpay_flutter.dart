import 'dart:async';
import 'dart:io';

import 'package:angel/donation_list.dart';
import 'package:angel/tab/message_page.dart';
import 'package:bootpay_flutter/bootpay_flutter.dart';
import 'package:flutter/material.dart';
import '../loginpage.dart';
import 'lesson.dart';



class Bootpayflutter extends StatefulWidget {


  //final UserDetails detailsUser;

  final UserDetails detailsUser;
  final String value; //price
  final Lesson lesson; //

  Bootpayflutter({Key key, this.detailsUser, this.value, this.lesson}) : super (key: key);

  @override
  _Bootpayflutter createState() => _Bootpayflutter();
}

class _Bootpayflutter extends State<Bootpayflutter> {
  String _paymentResult = '';

  get donateCount => null;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    String bootpayApplicationId;
    if (Platform.isAndroid) {
      bootpayApplicationId = "5d35a802b6d49c612d0793d7"; // 안드로이드용 bootpay applicationId
    } else {
      bootpayApplicationId = "5d35a802b6d49c612d0793d8"; // ios용 bootpay applicationId
    }

    String paymentResult;
    final UserInfo userInfo = UserInfo(username: "최희선", email: "hschoi520@naver.com");  //정보 넘겨야됨 firebase 소지야 화이팅!
    final PayParam payParam = PayParam(
        price: '${widget.value}',
        applicationId: bootpayApplicationId, // your_bootpay_id (Android or iOS)
        name: '${widget.lesson.title}',
        userInfo: userInfo,
        orderId: "BootpayTest000001");

    try {
      final PayResult result = await BootpayFlutter.pay(payParam);
      if (result.action == "BootpayDone") {

        // 결제성공
        print("결제 성공");
/*
        final firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('payment')
            .child('done')
            .child('${DateTime.now().millisecondsSinceEpoch}.txt')
        final task = firebaseStorageRef.putFile(

        )
*/

      } else if (result.action == "BootpayCancel") {
        // 사용자가 결제완료전에 결제를 중지한 상태.
        print("사용자 결제 취소");
      } else if (result.action == "BootpayError") {
        // 결제에러
        print("결제 에러");
      }
      paymentResult = result.toString();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessagePage(widget.detailsUser, widget.lesson, widget.value)),

      );

    } on Exception {
      paymentResult = 'Payment Failed.';
    }

    setState(() {
      _paymentResult = paymentResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bootpay flutter example app'),
        ),
        body: Center(
          child: Text('Payment Result : $_paymentResult'),
        ),
      ),
    );
  }
}