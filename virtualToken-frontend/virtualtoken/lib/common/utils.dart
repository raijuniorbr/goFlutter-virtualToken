import 'package:flutter/material.dart';

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
        //colors: [Colors.black, Colors.black, Colors.black87, Colors.black87, Colors.black],
        colors: [Colors.white, Colors.white, Colors.white60, Colors.white60, Colors.white],
        stops: [0.1, 0.1, 0.4, 0.6, 0.9],
      ),
    ),
    child: child,
  );
}
