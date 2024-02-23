import 'package:bus/pages/Home_page.dart';
import 'package:bus/pages/SignUp.dart';
import 'package:bus/pages/Signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context , snapshot){  

        if(snapshot.hasData){
          return HomePage();
        }
        else{
          return SigninPage();
        }

      }
    ),
    );
  }
}