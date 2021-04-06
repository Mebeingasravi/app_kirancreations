import 'package:kirancreations/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:kirancreations/services/getTx.dart';
import 'package:kirancreations/services/getUserDetails.dart';
import 'package:kirancreations/UI/ShowTxDetails.dart';
import 'package:kirancreations/UI/AddTxPage.dart';
import 'package:kirancreations/services/dbase.dart';
import 'package:kirancreations/model/Tx.dart';
import 'package:kirancreations/model/dbase.dart';

class UserTxsPage extends StatefulWidget {
  UserTxsPage({Key key, this.dt}) : super(key: key);

  final Details dt;

  @override
  _UserTxsPageState createState() => _UserTxsPageState(dt);
}

class _UserTxsPageState extends State<UserTxsPage> {
  final Details dt;
  _UserTxsPageState(this.dt);
  int _currentIndex = 0;

  Auth auth = new Auth();
  void initState() {
    super.initState();
  }

  _showDetails(Tx tx) {
    print('listTile clicked');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShowTxDetailsPage(tx: [tx, dt.userDetails])),
    );
    // txs.forEach((usr) => print('user details &&&&&&&&&&&&&&&&& ${usr.comment}'));
  }

  @override
  Widget build(BuildContext context) {
    // txs.forEach((tx) => print('txs' + tx.amount.toString()));
    return Scaffold(
        appBar: AppBar(title: Text(dt.userDetails.fname)),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: dt.txs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () => _showDetails(dt.txs[index]),
                        leading: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.blue,
                          size: 24.0,
                          semanticLabel: 'account icon',
                        ),
                        title: Text(dt.txs[index].id.toString()),
                        subtitle: Text(dt.txs[index].comment),
                        trailing: Text(
                          dt.txs[index].amount.toString(),
                          style: TextStyle(color: dt.txs[index].txType==0?Colors.red:Colors.green, fontSize: 10),
                        ));
                  }))
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            // currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.send_rounded),
                label: 'send',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Receive',
                backgroundColor: Colors.green,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  {
                    //call insert page with setting send
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddTxPage(txtype: [false, dt.userDetails])));
                  }
                  break;
                case 1:
                  {
                    // search
                  }
                  break;
                default:
                  {
                    //call insert page with setting send
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddTxPage(txtype: [true, dt.userDetails])));
                  }
                  break;
              }
            }));
  }
}

// class UserTxsPage extends StatefulWidget {
//   UserTxsPage({Key key, this.txs}) : super(key: key);

//   final List<Tx> txs;

//   @override
//   _UserTxsPageState createState() => _UserTxsPageState(txs);
// }

// class _UserTxsPageState extends State<UserTxsPage> {
//   final List<Tx> txs;
//   _UserTxsPageState(this.txs);

//   Auth auth = new Auth();
//   void initState() {
//     super.initState();
//   }

//   _showDetails(Tx tx) {
//     print('listTile clicked');
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ShowTxDetailsPage(tx: tx)),
//     );
//     // txs.forEach((usr) => print('user details &&&&&&&&&&&&&&&&& ${usr.comment}'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // txs.forEach((tx) => print('txs' + tx.amount.toString()));
//     return Scaffold(
//         appBar: AppBar(title: Text('Transactions')),
//         body: Column(children: <Widget>[
//           Expanded(
//               child: ListView.builder(
//                   itemCount: txs.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                         onTap: () => _showDetails(txs[index]),
//                         leading: Icon(
//                           Icons.account_circle_outlined,
//                           color: Colors.blue,
//                           size: 24.0,
//                           semanticLabel: 'account icon',
//                         ),
//                         title: Text(txs[index].comment),
//                         subtitle: Text(txs[index].comment),
//                         trailing: Text(txs[index].amount.toString()));
//                   }))
//         ]));
//   }
// }
