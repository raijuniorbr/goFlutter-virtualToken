// Copyright 2023 Naran. All rights reserved.
// Use of this source code is governed by a BSD-style license.
//
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualtoken/controllers/device_token_controller.dart';
import 'package:virtualtoken/modules/device_token_activator.dart';
import 'package:virtualtoken/modules/device_tokens_generator.dart';
import './form_device_tokens.dart';
import './device_tokens_table.dart';

class HomePage extends StatefulWidget {
  final DeviceTokenController _deviceTokenController = DeviceTokenController();

  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<SharedPreferences> futurePrefs;

  void _refreshList() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futurePrefs = widget._deviceTokenController.loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SharedPreferences>(
          future: futurePrefs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.getStringList('tokens') == null || (snapshot.data!.getStringList('tokens').toString() == '[]')) {
                return ListView(children: [
                  FormDeviceToken(widget._deviceTokenController, _refreshList),
                  DeviceTokenTable(widget._deviceTokenController, _refreshList)
                ]);
              } else {
                //return TokenGenerator();
                return DeviceTokenActivator(widget._deviceTokenController, _refreshList);
              }
            }
            return const Center(child: SizedBox(width: 80, height: 80, child: CircularProgressIndicator()));
          }),
    );
  }
}
