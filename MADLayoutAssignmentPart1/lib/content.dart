import 'package:LayoutAssignmentPart1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Content extends StatelessWidget {
  final List<Devices> devices;
  final Function deviceState;
  const Content({Key? key, required this.devices, required this.deviceState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Hello'),
      Icon(FontAwesome.lightbulb_o),
    ]);
  }
}
