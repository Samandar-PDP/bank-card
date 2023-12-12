class Card {
  String? id;
  String? createdAt;
  String? ownerName;
  String? expireDate;
  String? number;
  String? color;
  String? bankName;

  Card.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = json['createdAt'],
        ownerName = json['ownerName'],
        expireDate = json['expireDate'],
        number = json['number'],
        color = json['color'],
        bankName = json['bankName'];
}
