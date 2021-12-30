import 'package:flutter/material.dart';
import './content.dart';

void main() => runApp(MyApp());

class Devices {
  late int id;
  late String name;
  late dynamic icon;
  late String place;
  bool state = false;

  Devices({
    required this.id,
    required this.name,
    required this.place,
    required this.icon,
    required this.state,
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final List<Devices> _devices = [
    Devices(
        id: 0,
        name: 'Porch Light',
        place: 'Front',
        icon: Icons.light,
        state: false),
    Devices(
        id: 1,
        name: 'Front Plug',
        place: 'Front',
        icon: Icons.account_tree_sharp,
        state: false),
    Devices(
        id: 2,
        name: 'Living Room Light',
        place: 'Living Room',
        icon: Icons.lightbulb,
        state: false),
    Devices(
        id: 3,
        name: 'Living Room Fan',
        place: 'Living Room',
        icon: Icons.ac_unit,
        state: false),
    Devices(
        id: 4,
        name: 'Kitchen Light',
        place: 'Kitchen',
        icon: Icons.light,
        state: false),
    Devices(
        id: 5,
        name: 'Kitchen Downlight',
        place: 'Kitchen',
        icon: Icons.light,
        state: false),
  ];

  void deviceState(int id) {
    int index = _devices.indexWhere((devices) => devices.id == id);
    setState(() {
      _devices[index].state = !_devices[index].state;
    });
  }

  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
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
          bottom: TabBar(controller: _tabcontroller, tabs: [
            Tab(text: 'All'),
            Tab(text: 'Front'),
            Tab(text: 'Living Room'),
            Tab(text: 'Kitchen')
          ]),
        ),
        body: TabBarView(controller: _tabcontroller, children: [
          Content(devices: _devices, deviceState: deviceState),
          Content(
              devices: _devices
                  .where((element) => element.place == "Front")
                  .toList(),
              deviceState: deviceState),
          Content(
              devices: _devices
                  .where((element) => element.place == "Living Room")
                  .toList(),
              deviceState: deviceState),
          Content(
              devices: _devices
                  .where((element) => element.place == "Kitchen")
                  .toList(),
              deviceState: deviceState)
        ]),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
