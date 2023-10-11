import 'package:flutter/material.dart';
import 'package:virtualtoken/common/utils.dart';
import 'package:virtualtoken/controllers/device_token_controller.dart';
import '../repositories/listview_card_interface.dart';
import '../common/globalvars.dart' as globals;
import '../common/cart_otp.dart';
import '../models/device_token.dart';

List<ListViewCard> _setItems(List<ListViewCard> theListItem, List<DeviceToken> devtoken, AnimationController controller,
    DeviceTokenController deviceTokenController) {
  for (int i = 0; i < devtoken.length; i++) {
    theListItem.add(CardOtp(i, controller, devtoken, deviceTokenController));
  }
  return theListItem;
}

class TokenGenerator extends StatefulWidget {
  final DeviceTokenController deviceTokenController = DeviceTokenController();

  TokenGenerator({super.key});

  @override
  TokenGeneratorState createState() => TokenGeneratorState();
}

class TokenGeneratorState extends State<TokenGenerator> with TickerProviderStateMixin {
  List<ListViewCard> items = [];

  // Matriz com os tokens gravados no dispositivo
  List<DeviceToken> devtoken = [];

  // Controlador na animação do "tempo de expiração" do token
  late AnimationController controller;

  bool edit = false;

  // Só lê na iniciação deste objeto e na SESSION
  @override
  void initState() {
    super.initState();
    //Preenche a matriz dos tokens
    devtoken = widget.deviceTokenController.getAllDeviceTokensSync();

    // inicia controller
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: globals.tokenPeriod),
    );

    items = _setItems(items, devtoken, controller, widget.deviceTokenController);

    // vincula o listener
    controller.addListener(() {
      if (controller.value <= 0.01) {
        widget.deviceTokenController.getToken(1, devtoken);
      }
    });

    // atualiza a matriz dos tokens com os respectivos virtuais
    widget.deviceTokenController.getToken(1, devtoken);

    // controle específico para o tipo de animação escolhida
    controller.forward(from: controller.value == 0.0 ? 1.0 : controller.value);
    controller.repeat(reverse: false);
  }

  Future<void> _onExitPressed() async {
    //final isConfirmed = await _isExitDesired();

    //if (isConfirmed && mounted) {
    _exitSetup();
    //}
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tem certeza?', style: Theme.of(context).textTheme.titleLarge),
                content: Text('Neste ponto os dados não estão salvos.', style: Theme.of(context).textTheme.bodyMedium),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child:
                        Text('Sair', selectionColor: Theme.of(context).primaryColor, style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('Ficar',
                        selectionColor: Theme.of(context).unselectedWidgetColor, style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              );
            }) ??
        false;
  }

  void _exitSetup() {
    controller.stop();
    Navigator.of(context).pop();
  }

  // Enfim ... o Widget!!!!
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          // Bar padrão
          appBar: AppBar(
            leading: IconButton(
              onPressed: _onExitPressed,
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.abc,
                  semanticLabel: "Botão para editar a lista",
                ),
                onPressed: () {
                  if (controller.isAnimating) {
                    controller.stop();
                    /*
                  setState(() {
                    if (!edit) {
                      edit = true;
                    } else {
                      edit = false;
                    }
                  });
                  */
                    ////Navigator.pushNamedAndRemoveUntil(
                    ////    context, globals.routeListTokens, (route) => false);
                    Navigator.pushNamed(context, globals.routeListTokens);
                  } else {
                    /*
                  setState(() {
                    if (edit) {
                      edit = false;
                    } else {
                      edit = true;
                    }
                  });
                   */
                    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
                    controller.repeat(reverse: false);
                  }
                },
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
            ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: items.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  color: Theme.of(context).dialogBackgroundColor,
                  child: ListTile(
                    //leading: (edit) ? item.buildLeading(context) : null,
                    subtitle: item.buildSubtitle(context),
                    //trailing: (edit) ? item.buildTrailing(context) : null,
                    trailing: item.buildTrailing(context),
                    title: item.buildTitle(context),
                  ),
                );
              },
            ),
          ),
/*
         floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            if (controller.isAnimating) {
              controller.stop();
              Navigator.pushNamedAndRemoveUntil(
                  context, globals.routeListTokens, (route) => false);
            }
          },
          child: Column(children: [
            Image.asset('assets/img/add.png'),
          ]),
        ),*/
        ));
  }
}
