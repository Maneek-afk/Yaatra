import 'package:bus/classes/Colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'notification');
              },
              icon:  const Icon(Icons.notifications),
              iconSize: 30,
              color: ColorPicker.primaryColor,
            ),
          ),
        ],
      );
  }
}
