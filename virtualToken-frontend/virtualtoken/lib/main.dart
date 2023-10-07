import 'package:flutter/material.dart';
import 'package:virtualtoken/controllers/home.dart';
import 'package:virtualtoken/modules/device_tokens_generator.dart';
import 'modules/form_device_tokens.dart';
import 'modules/device_tokens_table.dart';

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
            title: const Text('Tokens'),
          ),
          body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  final HomeController _homeController = HomeController();

  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool home1 = false;
  void _refreshList() {
    setState(() {});
  }

  @override
  // Widget build(BuildContext context) {
  //   return ListView(children: [
  //     if (home1) FormDeviceToken(widget._homeController, _refreshList) else TokenGenerator(widget._homeController, _refreshList),
  //     if (home1) DeviceTokenTable(widget._homeController, _refreshList)
  //   ]);
  // }
  Widget build(BuildContext context) {
    return TokenGenerator(widget._homeController, _refreshList);
  }
}
