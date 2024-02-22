import 'package:bus/classes/Auth.dart';
import 'package:bus/classes/Colors.dart';
import 'package:bus/pages/AboutusPage.dart';
import 'package:bus/pages/HelpPage.dart';
import 'package:bus/pages/Home_page.dart';
import 'package:bus/pages/LoginPage.dart';
import 'package:bus/pages/NotifiPage.dart';
import 'package:bus/pages/SearchResultPage.dart';
import 'package:bus/pages/Signinpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: AuthPage(),
      routes: {
        // '':(context)=>   SigninPage(),
        'aboutus':(context)=>  const AboutusPage(),
        'home':(context)=>  const HomePage(),
        'search':(context)=>  const SearchResultsPage(),
        'help':(context)=>  const HelpPage(),
        'notification':(context)=>  const NotifiPage(),
        'sigin':(context)=>   SigninPage(),
        'login':(context)=>   LoginPage(),
      },
     
    );
  }
}