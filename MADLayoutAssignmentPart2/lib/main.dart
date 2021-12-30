import 'package:flutter/material.dart';
import './content.dart';

void main() => runApp(MyApp());

class Devices {
  late int id;
  late String name;
  late dynamic icon;
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
}

class _MyAppState extends State<MyApp> {
  final List<Devices> _devices = [
    Devices(id: 0, name: 'Porch Light', icon: Icons.light, state: false),
    Devices(
        id: 1,
        name: 'Front Plug',
        icon: Icons.account_tree_sharp,
        state: false),
    Devices(
        id: 2, name: 'Living Room Light', icon: Icons.lightbulb, state: false),
    Devices(id: 3, name: 'Living Room Fan', icon: Icons.ac_unit, state: false),
    Devices(id: 4, name: 'Kitchen Light', icon: Icons.light, state: false),
    Devices(id: 5, name: 'Kitchen Downlight', icon: Icons.light, state: false),
  ];

  void deviceState(int id) {
    int index = _devices.indexWhere((devices) => devices.id == id);
    setState(() {
      _devices[index].state = !_devices[index].state;
    });
  }

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
          backgroundColor: Colors.white,
        ),
        body: Content(devices: _devices, deviceState: deviceState),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
