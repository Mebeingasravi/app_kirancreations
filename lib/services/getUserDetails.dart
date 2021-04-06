// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kirancreations/model/Tx.dart';

// class UserDetails {
//   // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<List<User>> getTxs() async {
//     print('get tx called');
//     FirebaseFirestore databaseReference = FirebaseFirestore.instance;
//     Map<String, dynamic> userdetails;
//     List<User> user;

//     await databaseReference
//         .collection('35Hii3J63QRBXre6TEkeqmjqyBg1')
//         .doc('8527750952')
//         .get()
//         .then((snap) {
//       userdetails = snap.data()['userDetails'];
//       // user = userdetails.map((k,v) => User.fromJson(i)).toList();
//       // user.forEach((tx) => print('tx comment &&&&&&&&&&&&&&&&& ${tx.fname}'));

//       // userdetails.map((i)=>print("iiiiiiiiiiiiiiiiiiiiiiii"+i['fname']));
//     });

//     return user;
//   }
// }

// class User {
//   final UserAddress userAddress;
//   final bool blockUser;
//   final int contrycode;
//   final String fname;
//   final String lname;
//   final String mobile;
//   final String nickName;
//   final String userProfilePhoto;

//   User(
//       {this.userAddress,
//       this.blockUser,
//       this.contrycode,
//       this.fname,
//       this.lname,
//       this.mobile,
//       this.nickName,
//       this.userProfilePhoto});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         userAddress: UserAddress.fromJson(json['address']),
//         blockUser: json['blockUser'],
//         contrycode: json['contrycode'],
//         fname: json['fname'],
//         lname: json['lname'],
//         mobile: json['mobile'],
//         nickName: json['nickName'],
//         userProfilePhoto: json['userProfilePhoto']);
//   }
// }

// class UserAddress {
//   final city;
//   final state;
//   final street;

//   UserAddress({this.city, this.state, this.street});
//   factory UserAddress.fromJson(Map<String, dynamic> json) {
//     return UserAddress(
//         city: json['city'], state: json['state'], street: json['street']);
//   }
// }

// // {
// //     "userDetails":{
// //             "address":{
// //                 "city": "New Delhi",
// //                 "state": "Delhi",
// //                 "street": "01, Mayur Vihar",
// //             },
// //             "blockUser": "false",
// //             "contrycode": "91",
// //             "fName": "Ravinder",
// //             "lName": "Joshi",
// //             "mobile": "8527750952",
// //             "nickName": "ravi",
// //     }
// // }
