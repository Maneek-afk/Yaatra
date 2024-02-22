import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 204, 241),
      appBar:  const PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: MyAppBar()),
      drawer:  const SideMenu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'If you have any questions or need assistance, feel free to contact our support team.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to contact support
                },
                child: Text('Contact Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
