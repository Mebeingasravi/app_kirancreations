import 'package:flutter/material.dart';
import 'package:kirancreations/UI/ShowTxDetails.dart';
import 'package:kirancreations/services/dbase.dart';
import 'package:kirancreations/model/dbase.dart';

class AddTxPage extends StatefulWidget {
  AddTxPage({Key key, this.txtype}) : super(key: key);

  final List<Object> txtype;

  @override
  _AddTxPageState createState() => _AddTxPageState(txtype);
}

class _AddTxPageState extends State<AddTxPage> {
    final List<Object> txtype1;
  _AddTxPageState(this.txtype1);
  var amountText = TextEditingController(text: "500");
  var commentText = TextEditingController(text: "testing purpuse");
  Dbase dbase;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool txtype=txtype1[0];
    UserDetails usrdetails=txtype1[1];
    return Scaffold(
      appBar: AppBar(title: Text('Add Tx')),
      body: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          controller: amountText,
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        TextField(
          decoration: InputDecoration(
              labelText: 'Comment',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          controller: commentText,
        ),
        Padding(padding: EdgeInsets.only(top: 200)),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            //save new tx entry
            dbase = new Dbase();
            Tx tx = new Tx(
                amount: int.parse(amountText.text),
                comment: commentText.text,
                id: DateTime.now(),
                txType: txtype);
            dbase
                .setTx('8999999999', amountText.text, commentText.text, txtype)
                .then((d) {
              if (d) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowTxDetailsPage(tx: [tx,usrdetails])),
                );
              }
            });
          },
        ),
      ]),
    );
  }
}

// Text('insert page ' + txtype.toString()),
