import 'package:bus/components/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bus/classes/Colors.dart';

class SigninPage extends StatelessWidget {
   SigninPage({Key? key}) : super(key: key);

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //signin method
void signinUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
    );
    // Navigate to the home page on successful sign-in
    Navigator.pushNamed(context, 'home');
  } catch (e) {
    // Handle sign-in errors here
    
  }
}


void dispose(){
  emailController.dispose();
  passwordController.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 137, 137),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 500,
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
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorPicker.textColor),
                ),

                const SizedBox(height: 50),

                //email textfield
                  //user textfield
                   CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                  ),


                const SizedBox(height: 20),

                  //password textfield
                  
                   CustomTextField(
                    labelText: 'Password',
                    controller: passwordController,
                  ),
                  
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    signinUser(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 96, 114, 129)),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorPicker.textColor, // Change text color to white
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
             
                
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a Member?',
                    style: TextStyle(
                      color: ColorPicker.textColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text('Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),),
                    )


                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
