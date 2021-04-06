import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

// abstract class BaseAuth {
//   Future<String> signInWithEmailAndPassword(String email, String password);
// Future<String> createUserWithEmailAndPassword(String email, String password);
// Future<String> currentUser();
// Future<void> signOut();
// }

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// @override
// Future<String> signInWithEmailAndPassword(String email, String password) async {
//     AuthResult res = await _firebaseAuth.signInWithEmailAndPassword(
//       email: email, password: password);
//     FirebaseUser user=res.user;
//   return res?.uid;
// }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    print("signInWithEmailAndPassword called");
    var usr;
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      usr = result.user.uid;
    } catch (e) {
      usr = "";
      print(e.toString());
    }
    return usr;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    final UserCredential res = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return res.user?.uid;
  }

  @override
  Future<String> currentUser() async {
    final User user = await _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    print('logout..........................');
    return _firebaseAuth.signOut();
  }
}
