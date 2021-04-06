import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirancreations/model/dbase.dart';

class Dbase {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<Details> lstDtails = <Details>[];
  Details dtails;

  final databaseReference =
      FirebaseFirestore.instance.collection('35Hii3J63QRBXre6TEkeqmjqyBg1');

  Future<List<Details>> getDetails() async {
    lstDtails = <Details>[];
    print('getDocs called');
    // final databaseReference =
    //     FirebaseFirestore.instance.collection('35Hii3J63QRBXre6TEkeqmjqyBg1');

    // get data once

    // await databaseReference.get().then((snapshot) {
    //   if (snapshot.docs != null) {
    //     snapshot.docs.forEach((doc) {
    //       print('doc id ++++++++++++++++' + doc.id.toString());
    //       dtails = Details.fromJson(doc.data());
    //       // lstDtails.add(dtails);
    //     });
    //   }
    // });

    // get realtime data

    await databaseReference.snapshots().listen((snapshot) {
      if (snapshot.docs != null) {
        snapshot.docs.forEach((doc) {
          print('doc id ++++++++++++++++' + doc.id.toString());
          dtails = Details.fromJson(doc.data());
          lstDtails.add(dtails);
        });
      }
    });

    // below one line line for text to check returned value is correct or not
    // lstDtails.forEach((dtails) => print('---------------------'+dtails.userDetails.fname));
    return lstDtails;
  }

  Future<bool> setTx(
      String benif, String amount, String comment, bool txtype) async {
    bool _isUpdated = false;
    print('setTx called');
    // DateTime dt=DateTime.now();
    Tx tx = new Tx(
        amount: int.parse(amount),
        comment: comment,
        id: DateTime.now(),
        txType: txtype);
    Map<String, dynamic> tx1 = tx.toJson();
    try {
      await databaseReference.doc(benif).update({
        'txs': FieldValue.arrayUnion([tx1])
      }).then((data) => _isUpdated = true);
    } catch (exp) {
      print('exp ' + exp);
      _isUpdated = false;
    }
    return _isUpdated;
  }
}

// snapshot.docs.forEach((doc) => lstDtails.add(Details.fromJson(doc.data())));
// print(doc.id.toString());
// dtails = Details.fromJson(doc.data());
// print(dtails.userDetails.fname);
// .update({'txs': FieldValue.arrayUnion(lsttx)});

// for adding data in userDetails

// await databaseReference.doc('8999999999')
//     .set({
//   'txs': [tx1]
// }, SetOptions(merge: true));
