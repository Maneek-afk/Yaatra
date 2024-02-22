import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:flutter/material.dart';
class NotifiPage extends StatelessWidget {
  const NotifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor:  Color.fromARGB(255, 158, 204, 241),

      appBar:  PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: MyAppBar()),
      drawer:  SideMenu(),

      body: Center(child: Text(" Notification Page")),
    );
  }
}