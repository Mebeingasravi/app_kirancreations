import 'package:flutter/material.dart';
import 'package:kirancreations/services/auth.dart';

class LoginPage extends StatelessWidget {
  void _login(context, email, pass) async {
    // setState(() {
    //   _counter++;
    // });
    Auth auth = new Auth();
    print(await auth.signInWithEmailAndPassword(email, pass).then(
        (value) => Navigator.of(context)
            .pushNamedAndRemoveUntil('/Splash', (Route<dynamic> route) => false)
        // print("user")
        ));
    print("user " + await auth.currentUser());
    print("log me");
  }

  Auth auth = new Auth();
  var emailText = TextEditingController(text: "mebeingasravi@gmail.com");
  var passText = TextEditingController(text: "Test@123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            controller: emailText,
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            controller: passText,
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          ElevatedButton(
            child: Text('Login'),
            // onPressed: () => signIn(),
            onPressed: () => _login(context, emailText.text, passText.text),
          ),
          Padding(padding: EdgeInsets.only(top: 100)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () => {auth.signOut()},
        // onPressed: () => {_text()},
        tooltip: 'Login',
        child: Icon(Icons.add),
      ),
    );
  }
}
