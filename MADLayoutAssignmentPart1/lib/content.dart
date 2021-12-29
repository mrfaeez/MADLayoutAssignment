import 'package:LayoutAssignmentPart1/main.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class Content extends StatelessWidget {
  final List<Devices> devices;
  final Function deviceState;
  const Content({Key? key, required this.devices, required this.deviceState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[100],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              devices.elementAt(0).icon,
                              color: devices.elementAt(0).state
                                  ? Colors.green[800]
                                  : Colors.red[800],
                              size: 50,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => deviceState(0),
                              child: const Icon(
                                Icons.power_settings_new,
                                color: Colors.grey,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(100.0)),
                                  side: BorderSide(
                                      width: 1.0, color: Colors.grey)),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      devices.elementAt(0).name.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      devices.elementAt(0).state ? ' > ON' : '> OFF',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        )
      ],
    );
  }
}
