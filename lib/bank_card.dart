class BankCard {
  String? id;
  String? createdAt;
  String? ownerName;
  String? expireDate;
  String? number;
  String? color;
  String? bankName;

  BankCard(this.id, this.createdAt, this.ownerName, this.expireDate,  this.number, this.color, this.bankName);

  BankCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = json['createdAt'],
        ownerName = json['ownerName'],
        expireDate = json['expireDate'],
        number = json['number'],
        color = json['color'],
        bankName = json['bankName'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'ownerName': ownerName,
      'expireDate': expireDate,
      'number': number,
      'color': color,
      'bankName': bankName
    };
  }
}
