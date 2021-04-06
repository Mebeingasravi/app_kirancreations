import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirancreations/model/Tx.dart';

class DBManager {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<Txs>> getTxs() async {
    print('get tx called');
    FirebaseFirestore databaseReference = FirebaseFirestore.instance;
    List<dynamic> txlist;
    List<Txs> txs;

    await databaseReference
        .collection('35Hii3J63QRBXre6TEkeqmjqyBg1')
        .doc('8527750952')
        .get()
        .then((snap) {
      txlist = snap.data()['txs'];
      txs = txlist.map((i) => Txs.fromJson(i)).toList();
      txs.forEach((tx) => print('tx comment ************************${tx.id}'));
    });

    return txs;
  }
}

// print("key" + key);
// print("userDetails" + event.data()['txs']);
// Tx txs = new Tx.fromJson(event.data()['txs']);
// print('Amount: ${txs.amount}');

// print(event.data()['txs']);
// event.data().forEach((key, value) {
// Tx tx = new Tx.fromJson(event.data()['txs']);
// print('person ${tx.amount}');
// });

// Map<String, dynamic> user=snap.data()['test1'];
// User user1 = User.fromJson(user);

// print('Howdy, ${user1.fname} ${user1.lname}!');

// snap.data()['test'].map((i) {
// Map<String, dynamic> user = snap.data()['test'][i];
// User user1 = User.fromJson(user);
// print('Howdy, ${user1.fname}!');
// });

// print('We sent the verification link to ${user.amount}.');
