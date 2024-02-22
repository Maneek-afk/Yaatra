import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
 final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 89, 97, 104),

      appBar: const PreferredSize(preferredSize :Size.fromHeight(kToolbarHeight) , child: MyAppBar()),
      drawer: const SideMenu(),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child:   SizedBox(
              height: 40,
              child: CupertinoSearchTextField(
                decoration:  BoxDecoration(
                  color: Color.fromARGB(255, 226, 225, 225),
                  border: Border.all(
                    color: Color.fromARGB(255, 61, 58, 58),
                    width: 1.3
                  ),
                  borderRadius: BorderRadius.circular(15.0) 
                ),
                controller: _textController,
                onSubmitted: (String value) {
                  
                 print(value);
                },
              ),
            ),
          ),
        ]),
    );
  }
}
