// Copyright 2023 Naran. All rights reserved.
// Use of this source code is governed by a BSD-style license.
//
import 'package:flutter/material.dart';
import 'package:virtualtoken/common/utils.dart';
import 'package:virtualtoken/controllers/device_token_controller.dart';
import 'package:virtualtoken/modules/device_tokens_table.dart';
import 'package:virtualtoken/modules/form_device_tokens.dart';
import '../common/globalvars.dart' as globals;

class DeviceTokenActivator extends StatefulWidget {
  final DeviceTokenController _deviceTokenController;
  final VoidCallback _refreshList;

  const DeviceTokenActivator(this._deviceTokenController, this._refreshList, {super.key});

  @override
  DeviceTokenActivatorState createState() => DeviceTokenActivatorState();
}

class DeviceTokenActivatorState extends State<DeviceTokenActivator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.token,
              semanticLabel: "Botão para editar a lista",
            ),
            onPressed: () {},
          ),
        ],
        //titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: const Color(globals.colorBlackApp),
        //foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/naran-completo-61px_prancheta.png',
                height: globals.iconSizeCCB, fit: BoxFit.cover, semanticLabel: 'Logotipo Naran.'),
          ],
        ),
      ),
      body: customContainer(
          context,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                "Autenticador",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize),
              ),
              Text(
                "Gerador de token virtual",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize),
              ),
              const Spacer(),
              const Icon(
                Icons.warning,
                size: 96,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Parece que ainda não há contas cadastradas do Naran Autenticador para este dispositivo móvel.",
                  style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _FormTokenActivator(widget._deviceTokenController, widget._refreshList)),
                      );
                      //_FormTokenActivator(widget._deviceTokenController, widget._refreshList);
                    },
                    child: const Text("Adicionar")),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}

class _FormTokenActivator extends StatefulWidget {
  final DeviceTokenController _deviceTokenController;
  final VoidCallback _refreshList;

  const _FormTokenActivator(this._deviceTokenController, this._refreshList, {super.key});

  @override
  _FormTokenActivatorState createState() => _FormTokenActivatorState();
}

class _FormTokenActivatorState extends State<_FormTokenActivator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              semanticLabel: "Apagar contas selecionadas",
            ),
            onPressed: () {},
          ),
        ],
        //titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: const Color(globals.colorBlackApp),
        //foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/naran-completo-61px_prancheta.png',
                height: globals.iconSizeCCB, fit: BoxFit.cover, semanticLabel: 'Logotipo Naran.'),
          ],
        ),
      ),
      body: ListView(children: [
        FormDeviceToken(widget._deviceTokenController, widget._refreshList),
        DeviceTokenTable(widget._deviceTokenController, widget._refreshList)
      ]),
    );
  }
}
