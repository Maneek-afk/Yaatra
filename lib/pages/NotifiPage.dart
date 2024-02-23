import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bus/components/BookedTicket.dart'; // Adjust import paths as needed
import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';

class NotifiPage extends StatefulWidget {
  @override
  State<NotifiPage> createState() => _NotifiPageState();
}

class _NotifiPageState extends State<NotifiPage> {
  String username = "";
  String departure = "";
  String from = "";
  String to = "";
  String passenger = "";



@override
void initState() {
  super.initState();
  getUserEmail();
}

void getUserEmail() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String email = user.email ?? "";
    getUsernameByEmail(email);
  } else {
    print("No user logged in.");
  }
}

Future<void> getUsernameByEmail(String email) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      String username = querySnapshot.docs.first['username'];
      setState(() {
        this.username = username; // Update the username variable
      });
      print("Username for email $email: $username");
    } else {
      print("No user found with email $email.");
    }
  } catch (e) {
    print("Error getting username: $e");
  }
}


void fetchTicketDetails() {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('collectionName');
    collectionRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          setState(() {
            departure = data['departure'] ?? "";
            from = data['from'] ?? "";
            to = data['to'] ?? "";
            passenger = data['passenger']?.toString() ?? "";
          });
        }
        // do something with the data
      });
    }).catchError((error) {
      print("Error getting documents: $error");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 204, 241),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      drawer: SideMenu(),
      body: BusTicket(
        name: username, // Replace with the actual user name
        from: from,
        to: to,
        departure: departure,
        passenger: int.tryParse(passenger) ?? 0, // Ensure passenger is an int
      ),
    );
  }
}
