/// messageItem.dart
///
/// Structure for display generated virtual tokens
///
import 'package:flutter/material.dart';
import '../repositories/listview_card_interface.dart';
import '../models/device_token.dart';
import '../common/utils.dart';
import '../common/custom_timer_painter.dart';
import '../common/globalvars.dart' as globals;
import '../controllers/home.dart';

/// A ListItem that contains data to display a seed.
class CardOtp implements ListViewCard {
  final String sender;
  final int body;
  final AnimationController controller;
  final List<DeviceToken> devtoken;
  final HomeController _homeController;

  // the class constructor
  CardOtp(this.sender, this.body, this.controller, this.devtoken, this._homeController);

  /// this implementation will be override theses methods:
  /// - Leading
  /// - Title
  /// - Subtitle
  /// - Trailing
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

  @override
  Widget buildTitle(BuildContext context) => Text(
        sender,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
      );

  @override
  //Widget buildSubtitle(BuildContext context) => Text(body);
  Widget buildSubtitle(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizedBox(
            height: 80,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _homeController.getToken(0, devtoken)![body].virtualTotp!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                              color: const Color(globals.colorBlueCCB)),
                        ),
                      ],
                    ),
                    SizedBox(
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
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  //Widget buildTrailing(BuildContext context) => const Text('buildingTrailler');
  Widget buildTrailing(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizedBox(
            width: 30,
            height: 70,
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
                          width: 20,
                          height: 20,
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    // Circle !!!
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.orange,
                                      color: const Color(globals.colorBlueCCB),
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
