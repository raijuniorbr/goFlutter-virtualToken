import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globalvars.dart' as globals;

/// container default to the app
/// Using image as wallpaper
Container customContainer(context, child) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage('assets/img/bg_home.png'),
      //   fit: BoxFit.cover,
      //   colorFilter: ColorFilter.mode(Colors.black, BlendMode.saturation),
      // ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.green, Colors.green, Colors.white10, Colors.white10, Colors.green],
        stops: [0.1, 0.1, 0.4, 0.6, 0.9],
      ),
    ),
    child: child,
  );
}

Future<SharedPreferences> loadSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();

  // Para debugar... globals.debug == true
  // Irá resetar o token:
  if (globals.mockReset || prefs.getStringList('tokens') == null || prefs.getStringList('tokens').toString() == '[]') {
    globals.mockReset = false;
    List<String>? tokens = prefs.getStringList('tokens');

    if (globals.mockPopListTokens) {
      //addTokenOnDevice(globals.jsonTokensDefault);
      tokens = [globals.jsonTokenMock];
      prefs.setStringList('tokens', tokens);
    } else {
      //tokens = [globals.jsonTokensDefault];
      tokens = [''];
      prefs.setStringList('tokens', tokens);
      globals.jsonTokens = prefs.getStringList('tokens')?[0];
    }
  }

  // Logs
  //globals.logsCCB = prefs.getStringList('logs')?[0] ?? globals.logsCCBDefault;

  return prefs;
}
