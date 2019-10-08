import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/customicons.dart';
import 'join_page.dart';
import 'widgets/formcard.dart';
import 'widgets/socialicons.dart';
import 'widgets/formcard2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'tab_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var twitterLogin = new TwitterLogin(
      consumerKey: 'z26gA3dIF1eNHpV0nNZq67zMQ ',
      consumerSecret: 'Im3nLn31GyinDz0miz3UcZFLV1VIXBMCSoTbPYrEeHpdSmeQoM '
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSelected = false;
  int groupValue = 0;

  Future<FirebaseUser> _signInG(BuildContext context) async{
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('Sign in')
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential= GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken
    );

    FirebaseUser userDetails= await _firebaseAuth.signInWithCredential(credential);
    ProviderDetails providerInfo= new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData= new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details=new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData
    );

    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new MyTabPage(detailsUser: details),
        ));
    return userDetails;

  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _handleRadioChange(int value) {
    setState(() {
      groupValue = value;

      switch (groupValue) {
        case 0:
          return true;
        case 1:
          return false;
      }
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FittedBox(
            child: Image.asset("assets/image_06.jpg"),
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 100.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/logo4.png',
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text("My Galaxy",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              color: Colors.white,
                              fontSize: ScreenUtil.getInstance().setSp(60),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Login",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(48),
                              fontFamily: "Poppins-Bold",
                              color: Colors.white,
                              letterSpacing: .6)),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 55.0,
                          ),
                          new Radio(
//                        title: const Text('개인'),
                            value: 0,
                            groupValue: groupValue,
                            onChanged: _handleRadioChange,
                            activeColor: Colors.deepPurpleAccent,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text("개인",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium", color: Colors.white,))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          new Radio(
//                        title: const Text('기관'),
                            value: 1,
                            groupValue: groupValue,
                            onChanged: _handleRadioChange,
                            activeColor: Colors.deepPurpleAccent,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text("기관",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium", color: Colors.white,))
                        ],
                      ),
                    ],

                  ),
                  // Padding(padding: ),
                  groupValue == 0 ? FormCard() : FormCard2(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Remember me",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium", color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text("Social Login",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.googlePlus,
                        onPressed: ()=> _signInG(context)
                            .then((FirebaseUser user)=>print(user))
                            .catchError((e)=> print(e)),
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin ,
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Route route =
                          MaterialPageRoute(builder: (context) => JoinPage());
                          Navigator.push(context, route);
                        },
                        child: Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.photoUrl, this.userEmail, this.providerData);
}

class ProviderDetails{
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}