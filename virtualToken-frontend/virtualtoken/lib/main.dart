// Copyright 2023 Naran. All rights reserved.
// Use of this source code is governed by a BSD-style license.
//
import 'package:flutter/material.dart';
import 'package:virtualtoken/modules/device_tokens_generator.dart';
import 'modules/home.dart';
import 'common/globalvars.dart' as globals;

///
/// Main program that run the resources:
///
/// - List tokens recorded on device.
/// - Generate virtual token
/// - Add the device onto CCB's backend
///
/// ### Copyright *N*aran *C*onsulting & *T*rainning - Brazil - Oct, 2023
/// by: **Rai Junior**
void main() {
  /// The glue between the widgets layer and the Flutter engine.
  //WidgetsFlutterBinding.ensureInitialized();

  /// Block the mobiles's orientation for PORTRAIT only
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(Semantics(
    explicitChildNodes: true,
    child: MaterialApp(
      title: 'Naran',
      // Show the 'debug' label on the screen top
      debugShowCheckedModeBanner: globals.debugMode,
      home: HomePage(),
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == globals.routeHome) {
          page = HomePage();
        } else if (settings.name == globals.routeTokenActivate) {
          //page = const TokenActivate();
        } else if (settings.name == globals.routeTokenGenerator) {
          page = TokenGenerator();
        } else if (settings.name == globals.routeQRView) {
          //page = const QRViewCCB();
        } else if (settings.name == globals.routeListTokens) {
          //page = const AddDelTokens();
        } else if (settings.name == globals.routeSettings) {
          //page = const SettingsScreen();
        } else if (settings.name!.startsWith(globals.routePrefixDeviceSetup)) {
          final subRoute = settings.name!.substring(globals.routePrefixDeviceSetup.length);
          //page = SetupFlow(
          //  setupPageRoute: subRoute,
          //);
        } else {
          throw Exception('Rota desconhecida: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    ),
  ));
}
