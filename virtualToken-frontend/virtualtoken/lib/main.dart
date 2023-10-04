import 'package:flutter/material.dart';
import 'package:virtualtoken/controllers/home.dart';
import 'package:virtualtoken/models/company_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tokens'),
          ),
          body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  final HomeController _homeController = HomeController();

  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [_Form(widget._homeController, _refreshList), _CompanyAccountTable(widget._homeController, _refreshList)]);
  }
}

class _Form extends StatefulWidget {
  final HomeController _homeController;
  final VoidCallback _refreshList;

  const _Form(this._homeController, this._refreshList);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNameFieldController = TextEditingController();
  final TextEditingController _accountURLFieldController = TextEditingController();

  @override
  void dispose() {
    _accountNameFieldController.dispose();
    _accountURLFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _accountNameFieldController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter account name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _accountURLFieldController,
              decoration: const InputDecoration(
                labelText: 'URL',
              ),
              //keyboardType: TextInputType.number,
              keyboardType: TextInputType.url,
              //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d]')),],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the URL';
                }
                return null;
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget._homeController.addCpnyAccount(CompanyAccount(
                          id: 0,
                          accountName: _accountNameFieldController.text,
                          accountKey: 'accountKey',
                          //int.parse(_accountURLFieldController.text)));
                          accountUrl: _accountURLFieldController.text));
                      _accountNameFieldController.clear();
                      _accountURLFieldController.clear();
                      widget._refreshList();
                    }
                  },
                  child: const Text('Add Account'),
                )),
          ],
        ),
      ),
    );
  }
}

class _CompanyAccountTable extends StatelessWidget {
  final HomeController _homeController;
  final VoidCallback _refreshList;

  const _CompanyAccountTable(this._homeController, this._refreshList);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CompanyAccount>>(
        future: _homeController.getAllCpnyAccounts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading..'));
          } else {
            return DataTable(columns: _createAccountTableColumns(), rows: _createAccountTableRows(snapshot.data ?? []));
          }
        });
  }

  List<DataColumn> _createAccountTableColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Account')),
      const DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> _createAccountTableRows(List<CompanyAccount> accounts) {
    return accounts
        .map((account) => DataRow(cells: [
              DataCell(Text('# + ${account.id.toString()}')),
              DataCell(Text('${account.accountName} (${account.accountUrl.toString()})')),
              DataCell(IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await _homeController.removeCpnyAccount(account.id);
                  _refreshList();
                },
              )),
            ]))
        .toList();
  }
}
