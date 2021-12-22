import 'package:flutter/material.dart';
import './content.dart';

void main() => runApp(MyApp());

class Devices {
  late int id;
  late String name;
  late String icon;
  bool state = false;

  Devices({
    required this.id,
    required this.name,
    required this.icon,
    required this.state,
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  final List<Devices> _devices = [
    Devices(id: 0, name: 'Porch Light', icon: 'light-ceiling', state: false),
    Devices(id: 1, name: 'Front Plug', icon: 'plug', state: false),
    Devices(
        id: 2,
        name: 'Living Room Light',
        icon: 'light-switch-on',
        state: false),
    Devices(id: 3, name: 'Living Room Fan', icon: 'fan', state: false),
    Devices(id: 4, name: 'Kitchen Light', icon: 'lightbulb', state: false),
    Devices(id: 5, name: 'Kitchen Downlight', icon: 'adjust', state: false),
  ];
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Home',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Home'),
        ),
        body: Center(child: Column(children: <Widget>[Content()])),
      ),
    );
  }
}
