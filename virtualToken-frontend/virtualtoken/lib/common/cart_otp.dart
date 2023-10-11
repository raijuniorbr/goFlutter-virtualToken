// Copyright 2023 Naran. All rights reserved.
// Use of this source code is governed by a BSD-style license.
//
import 'package:flutter/material.dart';
import '../repositories/listview_card_interface.dart';
import '../models/device_token.dart';
import '../common/custom_timer_painter.dart';
import '../common/globalvars.dart' as globals;
import '../controllers/device_token_controller.dart';

/// card_otp.dart
///
/// Structure for display generated virtual tokens
///
class CardOtp implements ListViewCard {
  final int body;
  final AnimationController controller;
  final List<DeviceToken> devtoken;
  final DeviceTokenController _deviceTokenController;

  CardOtp(this.body, this.controller, this.devtoken, this._deviceTokenController);

  /// this implementation will be override theses methods:
  /// - Leading
  /// - Title
  /// - Subtitle
  /// - Trailing
  ///

  /// buildLeading
  ///
  /// [ ] Marcado
  /// [ ] Desmarcado
  ///
  @override
  Widget buildLeading(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
      child: ((devtoken[body].delete ?? false) ? devtoken[body].delete! : false)
          ? const Icon(
              Icons.check_box_outline_blank_rounded,
              semanticLabel: 'Espaço para marcar está desmarcado.',
            )
          : const Icon(
              Icons.check_box_rounded,
              semanticLabel: 'Espaço para marcar, está marcado.',
            ),
      onPressed: () {
        devtoken[body].delete = devtoken[body].delete! ? true : false;
      },
    );

    /*
    TextButton(
      child: Image.asset('assets/img/excluir_button.png'),
      onPressed: () {
        //delete action for this button
        devtoken.removeWhere((element) {
          return element.token == devtoken[body].token;
        }); //go through the loop and match content to delete from list
        //setState(() {
        saveTokensOnDevices(jsonEncode(devtoken));
        //});
      },
    );
    */
  }

  /// buildTitle
  ///
  /// In this case, Title will be lines with small size fonts
  ///+----------------------------+
  ///| + Company
  ///| + Account name (secretURL)
  ///+----------------------------+
  @override
  Widget buildTitle(BuildContext context) => Text(
        "${devtoken[body].accountName}\n${devtoken[body].secretKeyURL}",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            color: const Color(globals.colorGreenApp)),
      );

  /// buildSubtitle
  ///
  /// In this case, Subtitle will be lines with medium size fonts
  ///+-------------------------+
  ///| + VirtualTotP (seed)
  ///+-------------------------+
  @override
  //Widget buildSubtitle(BuildContext context) => Text(body);
  Widget buildSubtitle(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${_deviceTokenController.getToken(0, devtoken)![body].virtualTotp!.substring(0, 3)} ${_deviceTokenController.getToken(0, devtoken)![body].virtualTotp!.substring(3, 6)}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                              color: Colors.black),
                        ),
                      ],
                    ),
// [ Progressbar ]
/*                     SizedBox(
                      height: 30,
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              // a progress bar !!!
                              child: CustomPaint(painter: ProgressPainter(value: controller.value)),
                            ),
                          ],
                        ),
                      ),
                    ),
 */
                  ],
                ),
              ],
            ),
          );
        });
  }

  /// buildTrailing
  ///
  /// On the right side ... in this case a Circular Progress image
  ///
  @override
  //Widget buildTrailing(BuildContext context) => const Text('buildingTrailler');
  Widget buildTrailing(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizedBox(
            width: 30,
            height: 50,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    // Circle !!!
                                    child: CustomPaint(
                                        painter: CircularTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white10,
                                      color: const Color(globals.colorGreenApp),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  //@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
