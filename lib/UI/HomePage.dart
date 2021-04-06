// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import 'package:kirancreations/UI/LoginPage.dart';
// import 'package:kirancreations/UI/HomePage.dart';
import 'package:kirancreations/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:kirancreations/services/getTx.dart';
import 'package:kirancreations/services/getUserDetails.dart';
import 'package:kirancreations/UI/UserTxs.dart';
import 'package:kirancreations/services/dbase.dart';
import 'package:kirancreations/model/Tx.dart';
import 'package:kirancreations/model/dbase.dart';
import 'package:kirancreations/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Auth auth = new Auth();
  DBManager db = new DBManager();
  Dbase dbase = new Dbase();
  List<Details> dtlslst = <Details>[];
  Future<List<Details>> listDetails;

  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() {
    auth.currentUser().then((user) {
      if (user == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/Splash', (Route<dynamic> route) => false);
      }
    });
  }

  _openUserTxsPage(Details dt) {
    print('listTile clicked');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserTxsPage(dt: dt)),
    );
    dt.txs.forEach(
        (usr) => print('/n /n user details &&&&&&&&&&&&&&&&& ${usr.comment}'));
  }

  Future<List<Details>> _createNewTx() async {
    List<Details> lstdel = await dbase.getDetails().then((lsdt) {
      lsdt.forEach((dtld) => print('dtld' + dtld.userDetails.fname));
    });
    return lstdel;
  }

  loaddata() {
    this.setState(() {
      listDetails = dbase.getDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    // _txs?.forEach((tx) => print('tx comment ################${tx.id}'));
    return Scaffold(
      appBar: AppBar(
        title: Text("Khata"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
                child: FutureBuilder(
                    future: dbase.getDetails(),
                    // future: listDetails,
                    builder: (context, snap) {
                      print('\n \n \n \n \n \n^^^^^^^^^^^^^^^^^^' +snap.hasData.toString());
                      if (snap.hasData) {
                        return ListView.builder(
                            itemCount: snap.data.length,
                            itemBuilder: (context, index) {
                              Details dt = snap.data[index];
                              List<Tx> txs = dt.txs;
                              txs.forEach((usr) => print(
                                  '\n \n \n \n \n \n user details &&&&&&&&&&&&&&&&& ${usr.comment}'));
                              return ListTile(
                                  onTap: () => _openUserTxsPage(dt),
                                  leading: Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.blue,
                                    size: 24.0,
                                    semanticLabel: 'account icon',
                                  ),
                                  title: Text(dt.userDetails.fname));
                            });
                      } else {
                        return Text('loading...');
                      }
                    })),
            // StreamBuilder<QuerySnapshot>(
            //   stream: db.getTxs()
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _createNewTx,
        onPressed: () => auth.signOut(),
        tooltip: 'Signout',
        child: Icon(Icons.add),
      ),
    );
  }
}







// Future<List<User>> _getUserList() async {
// UserDetails ud=new UserDetails();
// List<User> usrs= await ud.getTxs();
// usrs.forEach((usr) => print('user details &&&&&&&&&&&&&&&&& ${usr.fname}'));
// }

// _getDb() async {
//   Dbase dbase = new Dbase();
//   // List<Details> lstDtails =
//   dbase.getDetails().then((lstDtails) {
//     // below one line line for text to check returned value is correct or not
//     lstDtails.forEach((dtails) => print(dtails.userDetails.fname));
//   });
// }

// Future<List<Txs>> _getTxs() async {
//   // Txs db = new Txs();
//   // return db.getTxs();
//   List<Txs> txs = await db.getTxs();
//   // this.setState(() => {_txs: txs});
//   // return txs;
//   return await db.getTxs();
// }

// void _logout() async {
//   auth.signOut().then((user) {
//     print("logout done");
//     Navigator.of(context)
//         .pushNamedAndRemoveUntil('/Splash', (Route<dynamic> route) => false);
//   });
// }

// _openUserTxsPage(List<Tx> txs) {
//   print('listTile clicked');
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => UserTxsPage(txs: txs)),
//   );
//   // txs.forEach((usr) => print('user details &&&&&&&&&&&&&&&&& ${usr.comment}'));
// }
