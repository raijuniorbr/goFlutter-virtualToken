class CompanyAccount {
  late int id;
  late String accountName;
  late String accountKey;
  late String accountUrl;

  CompanyAccount({required this.id, required this.accountName, required this.accountKey, required this.accountUrl});

  factory CompanyAccount.fromJson(Map json) {
    return CompanyAccount(
        id: json['id'], accountName: json['accountName'], accountKey: json['accountKey'], accountUrl: json['accountUrl']);
  }

  CompanyAccount.fromMap(Map data)
      : id = data['id'],
        accountName = data['accountName'],
        accountKey = data['accountKey'],
        accountUrl = data['accountUrl'];

  Map<String, dynamic> toMap() {
    return {'id': id, 'accountName': accountName, 'accountKey': accountKey, 'accountUrl': accountUrl};
  }
}
