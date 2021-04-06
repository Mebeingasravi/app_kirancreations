// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import 'package:kirancreations/UI/LoginPage.dart';
// import 'package:kirancreations/UI/HomePage.dart';
import 'package:kirancreations/services/auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var user;
  Auth auth = new Auth();

  void initState() {
    super.initState();
    auth.currentUser().then((user) {
      this.setState(() {
        user = user;
      });
      if (user == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('SSC'), backgroundColor: Colors.deepPurpleAccent),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          // child: nextPage(),
          child: Text('Kiran Creation'),
        ),
      ),
    );
  }
}
