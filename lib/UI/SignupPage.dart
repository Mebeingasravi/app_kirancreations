import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  //   print("log me");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Singup")),
      body: Center(
        child: Text('Signup Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/Login")},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
