import 'package:flutter/material.dart';
import './UI/SplashPage.dart';
import './UI/HomePage.dart';
import './UI/LoginPage.dart';
import 'UI/SignupPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Firebase init completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Hisab',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/Splash': (BuildContext context) => SplashPage(),
        '/Home': (BuildContext context) => HomePage(),
        '/Signup': (BuildContext context) => SignupPage(),
        '/Login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
