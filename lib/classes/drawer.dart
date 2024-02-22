import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Top component of drawer 
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, 
    required this.name,
  });

final String name;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(CupertinoIcons.person),
      ),
      title: Text(name,
      style:const  TextStyle(
        color: Colors.white
      ),),
                );
  }
}

//side menu content like home..etc  
class SideMenuContent extends StatelessWidget {
  const SideMenuContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}