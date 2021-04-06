import 'package:kirancreations/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:kirancreations/services/getTx.dart';
// import 'package:kirancreations/services/getUserDetails.dart';
// import 'package:kirancreations/services/dbase.dart';
// import 'package:kirancreations/model/Tx.dart';
import 'package:kirancreations/model/dbase.dart';

class ShowTxDetailsPage extends StatefulWidget {
  ShowTxDetailsPage({Key key, this.tx}) : super(key: key);

  // final Tx tx;
  final List<Object> tx;

  @override
  _ShowTxDetailsPageState createState() => _ShowTxDetailsPageState(tx);
}

class _ShowTxDetailsPageState extends State<ShowTxDetailsPage> {
  // final Tx tx;
  final List<Object> tx1;
  _ShowTxDetailsPageState(this.tx1);

  Auth auth = new Auth();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Tx tx = tx1[0];
    UserDetails usrdtl=tx1[1];
    print('txs' + tx.amount.toString());
    return Scaffold(
        appBar: AppBar(title: Text('Transactions Details')),
        body: Column(children: <Widget>[
          Text(usrdtl.fname),
          Text(tx.amount.toString()),
          Text(tx.id.toString()),
          Text(tx.comment),
          Text(tx.txType?'debit':'credit'),
          Text('Edit')
        ]));
  }
}
