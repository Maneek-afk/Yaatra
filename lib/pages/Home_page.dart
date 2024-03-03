import 'package:bus/classes/Colors.dart';
import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Scrollables.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor:  Color.fromARGB(255, 224, 221, 221),
      //appbar drawer and notification
      // appBar:  PreferredSize(preferredSize :Size.fromHeight(kToolbarHeight) , child: MyAppBar()),
      drawer: SideMenu(),
      //body 
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 92, 37, 37),
            expandedHeight: 100,
            title: const  Text('Y A A T R A',style: TextStyle(color: ColorPicker.textColor),), 
            centerTitle: true,// Example expanded height
            pinned: true,

            flexibleSpace: FlexibleSpaceBar(  
              background: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromARGB(255, 187, 8, 8),
              child: const MyAppBar()),
             ),
          ),

           SliverToBoxAdapter(
            child: Scrollables(imageAsset: 'lib/images/pokhara.jpg',cityName: 'Pokhara',)
          ),

           SliverToBoxAdapter(
            child: Scrollables(imageAsset: 'lib/images/chitwan.jpg',cityName: 'Chitwan',)
          ),

           SliverToBoxAdapter(
            child: Scrollables(imageAsset: 'lib/images/Ilam_a.jpg',cityName: 'Illam',)
          ),

           SliverToBoxAdapter(
            child: Scrollables(imageAsset: 'lib/images/mustang.jpg',cityName: 'Mustang',)
          ),

           SliverToBoxAdapter(
            child: Scrollables(imageAsset: 'lib/images/janakpur.jpg',cityName: 'Janakpur',)
          ),


        
         

        ],

      )
      
    );
  }
}

