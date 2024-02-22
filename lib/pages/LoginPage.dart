import 'package:bus/components/Textfield.dart'; // Import CustomTextField
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bus/classes/Colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController(); // Add repasswordController

  void signUpUser(BuildContext context) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim(),
    );
    addUserDetail(
      usernameController.text.trim(), 
      emailController.text.trim(),
      passwordController.text.trim()
    );
    Navigator.pushNamed(context, 'home');
  } 

  Future addUserDetail(String username,String email,String password) async {
    await FirebaseFirestore.instance.collection('user').add({
      'username': username,
      'email': email,
      'password': password,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 137, 137),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 200, // Adjusted height
              decoration: const BoxDecoration(
                color: ColorPicker.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Log In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorPicker.textColor),
                  ),
                  const SizedBox(height: 10),

                  CustomTextField(
                    labelText: 'Username',
                    controller: usernameController,
                  ),
                  const SizedBox(height: 20),
                  
                  CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
                  
                  CustomTextField(
                    labelText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  
                  CustomTextField(
                    labelText: 'Confirm Password',
                    controller: repasswordController,
                  ),
                  const SizedBox(height: 20),
                  
                  ElevatedButton(
                    onPressed: () {
                      signUpUser(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 96, 114, 129)),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorPicker.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
