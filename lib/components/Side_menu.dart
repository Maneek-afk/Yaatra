import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/drawer.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        width: 288,
        height: double.infinity,
        //drawer color
        color: Color.fromARGB(255, 10, 10, 10),
        child:   SafeArea(
          child:  Column(
            children: [
              const SizedBox(height: 20,),
              //top layer
               const InfoCard(name: 'Test User',
              ),
               const SizedBox(height: 10,),
              const Padding(
          padding: EdgeInsets.only(left: 105),
          child: Divider(
            color: Colors.white,
            height: 1,  
          ),
        ),
            
            const SizedBox(height: 10,),

              //second layer listyle assets
              SideMenuContent(
                icon: CupertinoIcons.home,
                title: 'Home',
                onTap: () {
                Navigator.pushNamed(context, 'home');
              },),

               SideMenuContent(
                icon: CupertinoIcons.search,
                title: 'Search',
                onTap: () {
                Navigator.pushNamed(context, 'search');
                },
              ),

               SideMenuContent(
                icon: CupertinoIcons.exclamationmark_bubble,
                title: 'Help',
                  onTap: () {
                   Navigator.pushNamed(context, 'help');
                },
              ),

                 SideMenuContent(
                icon: CupertinoIcons.info_circle,
                title: 'About us',
                onTap: () {
                 Navigator.pushNamed(context, 'aboutus');
                },
              ),

              Expanded(child: Container( )),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                 onPressed: () {
                    print("Sign-out button pressed"); // Debugging statement
                    try {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, 'sigin');
                    } catch (e) {
                      print("Error signing out: $e"); // Debugging statement
                    }
                  },              
                  
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                  ), 
                  child:const SizedBox(
                    width: 83,
                    child: Row(
                      children: [
                         Padding(
                           padding: EdgeInsets.only(right: 5),
                           child: Text("Sign out",style: TextStyle(color: Color.fromARGB(255, 53, 52, 52)),),
                         ),
                         Icon(Icons.logout_outlined,color: Color.fromARGB(255, 53, 52, 52),),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


