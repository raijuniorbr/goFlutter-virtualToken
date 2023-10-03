class CompanyAccount {
  final int id;
  final String accountName;
  final String accountKey;
  final String accountUrl;

  CompanyAccount(this.id, this.accountName, this.accountKey, this.accountUrl);

  CompanyAccount.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        accountName = data['accountName'],
        accountKey = data['accountKey'],
        accountUrl = data['accountUrl'];

  Map<String, dynamic> toMap() {
    return {'id': id, 'accountName': accountName, 'accountKey': accountKey, 'accountUrl': accountUrl};
  }
}
