import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dart_dash_otp/dart_dash_otp.dart';
import 'package:base32/base32.dart';

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
            title: const Text('Validar Token Virtual'),
          ),
          body: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _Form(_refreshList),
      //_ViewValidatedToken(_refreshList)
    ]);
  }
}

class _Form extends StatefulWidget {
  final VoidCallback _refreshList;

  const _Form(this._refreshList);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tokenFieldController = TextEditingController();
  bool validado = false;
  String theSecret = base32.encodeString("naranteste"); // "NZQXEYLOORSXG5DF"; // "J22U6B3WIWRRBTAV"
  int myInterval = 60;
  TOTP totp = TOTP(secret: "", interval: 60, digits: 6);

  @override
  void initState() {
    super.initState();
    totp = TOTP(secret: theSecret, interval: myInterval, digits: 6);
  }

  @override
  void dispose() {
    _tokenFieldController.dispose();
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
              controller: _tokenFieldController,
              decoration: const InputDecoration(
                labelText: 'Token a validar',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d]')),
              ],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Digite o token';
                }
                return null;
              },
            ),
            Row(
                //mainAxisAlignment: EdgeInsets.only(top: 10.0),
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        validado = totp.verify(otp: _tokenFieldController.text);
/*                       await widget._homeController.addCpnyAccount(CompanyAccount(
                          id: 0,
                          accountName: _accountNameFieldController.text,
                          accountKey: 'accountKey',
                          //int.parse(_accountURLFieldController.text)));
                          accountUrl: _accountURLFieldController.text));
                      _accountNameFieldController.clear();
                      _accountURLFieldController.clear();
 */
                        widget._refreshList();
                      }
                    },
                    child: const Text('Validar o token'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        /// initialization for custom interval and digit values
                        totp = TOTP(secret: theSecret, interval: myInterval, digits: 6);
                        widget._refreshList();
                      }
                    },
                    child: const Text('Resincronizar relógio'),
                  ),
                ]),
            Text("\nValidado: $validado"),
            Text("\nSecret: $theSecret"),
          ],
        ),
      ),
    );
  }
}
