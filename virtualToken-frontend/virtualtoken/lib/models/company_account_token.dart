class CompanyAccountToken {
  late int id;
  late String accountName;
  late String accountKey;
  late String accountUrl;

  CompanyAccountToken({required this.id, required this.accountName, required this.accountKey, required this.accountUrl});

  factory CompanyAccountToken.fromJson(Map json) {
    return CompanyAccountToken(
        id: json['id'], accountName: json['accountName'], accountKey: json['accountKey'], accountUrl: json['accountUrl']);
  }

  CompanyAccountToken.fromMap(Map data)
      : id = data['id'],
        accountName = data['accountName'],
        accountKey = data['accountKey'],
        accountUrl = data['accountUrl'];

  Map<String, dynamic> toMap() {
    return {'id': id, 'accountName': accountName, 'accountKey': accountKey, 'accountUrl': accountUrl};
  }
}
