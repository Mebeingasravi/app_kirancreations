// import 'dart:convert';

// Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

// String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
    Details({
        this.txs,
        this.userDetails,
    });

    List<Tx> txs;
    UserDetails userDetails;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        txs: List<Tx>.from(json["txs"].map((x) => Tx.fromJson(x))),
        userDetails: UserDetails.fromJson(json["userDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "txs": List<dynamic>.from(txs.map((x) => x.toJson())),
        "userDetails": userDetails.toJson(),
    };
}

class Tx {
    Tx({
        this.amount,
        this.comment,
        this.id,
        this.txType,
    });

  final DateTime id;
  final int amount;
  final String comment;
  final bool txType;

    factory Tx.fromJson(Map<String, dynamic> json) => Tx(
        amount: json["amount"],
        comment: json["comment"],
        id: json["id"].toDate(),
        txType: json["txType"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "comment": comment,
        "id": id,
        "txType": txType,
    };
}

class UserDetails {
    UserDetails({
        this.address,
        this.blockuser,
        this.countrycode,
        this.fname,
        this.lname,
        this.mobile,
        this.nickName,
    });

    Address address;
    bool blockuser;
    String countrycode;
    String fname;
    String lname;
    String mobile;
    String nickName;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        address: Address.fromJson(json["address"]),
        blockuser: json["blockUser"],
        countrycode: json["countrycode"],
        fname: json["fname"],
        lname: json["lname"],
        mobile: json["mobile"],
        nickName: json["nickName"],
    );

    Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "blockUser": blockuser,
        "countrycode": countrycode,
        "fname": fname,
        "lname": lname,
        "mobile": mobile,
        "nickName": nickName,
    };
}

class Address {
    Address({
        this.city,
        this.state,
        this.street,
    });

    String city;
    String state;
    String street;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        state: json["state"],
        street: json["street"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "street": street,
    };
}
