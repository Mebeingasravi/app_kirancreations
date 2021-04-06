class Txs {
  final DateTime id;
  final int amount;
  final String comment;
  final bool txtype;

  Txs({this.id, this.amount, this.comment, this.txtype});

  factory Txs.fromJson(Map<String, dynamic> json) {
    return Txs(
        id: json['id'].toDate(),
        amount: json['amount'],
        comment: json['comment'],
        txtype: json['txtype']);
  }
}