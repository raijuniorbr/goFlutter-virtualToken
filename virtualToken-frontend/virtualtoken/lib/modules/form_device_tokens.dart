// Copyright 2023 Naran. All rights reserved.
// Use of this source code is governed by a BSD-style license.
//
import 'package:flutter/material.dart';
import 'package:virtualtoken/controllers/device_token_controller.dart';
import 'package:virtualtoken/models/device_token.dart';
import 'package:uuid/uuid.dart';

class FormDeviceToken extends StatefulWidget {
  final DeviceTokenController _deviceTokenController;
  final VoidCallback _refreshList;

  const FormDeviceToken(this._deviceTokenController, this._refreshList, {super.key});

  @override
  FormDeviceTokenState createState() => FormDeviceTokenState();
}

class FormDeviceTokenState extends State<FormDeviceToken> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNameFieldController = TextEditingController();
  final TextEditingController _secretKeyURLFieldController = TextEditingController();
  final TextEditingController _secretKeyFieldController = TextEditingController();

  @override
  void dispose() {
    _accountNameFieldController.dispose();
    _secretKeyURLFieldController.dispose();
    _secretKeyFieldController.dispose();
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
              controller: _secretKeyURLFieldController,
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
            TextFormField(
              controller: _secretKeyFieldController,
              decoration: const InputDecoration(
                labelText: 'Secret Key',
              ),
              //keyboardType: TextInputType.number,
              keyboardType: TextInputType.text,
              //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d]')),],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Secret Key';
                }
                return null;
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget._deviceTokenController.addDeviceTokens(DeviceToken(
                          deviceId: const Uuid().v1(),
                          accountName: _accountNameFieldController.text,
                          secretKey: _secretKeyFieldController.text,
                          //int.parse(_secretKeyURLFieldController.text)));
                          secretKeyURL: _secretKeyURLFieldController.text));
                      _accountNameFieldController.clear();
                      _secretKeyURLFieldController.clear();
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
