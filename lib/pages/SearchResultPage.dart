import 'package:bus/components/MyAppbar.dart';
import 'package:bus/components/Side_menu.dart';
import 'package:bus/pages/SearchBookPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({super.key});
  final List<String> places = [
    'Pokhara',
    'Chitwan',
    'Illam',
    'Mustang',
    'Janakpur',
    'bhaktapur'
  ];

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final TextEditingController _textController = TextEditingController();
  List<String> _filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    _filteredPlaces = widget.places;
  }

  void _filterPlaces(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPlaces = widget.places;
      } else {
        _filteredPlaces = widget.places
            .where((place) => place.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 97, 104),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: MyAppBar()),
      drawer: const SideMenu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: SizedBox(
              height: 40,
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 225, 225),
                  border: Border.all(
                    color: Color.fromARGB(255, 61, 58, 58),
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                controller: _textController,
                onSubmitted: (String value) {
                  _filterPlaces(value);
                },
                onChanged: (String value) {
                  _filterPlaces(value);
                },
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text("Available Routes",
            style: TextStyle(
              color: Color.fromARGB(255, 221, 217, 217),
              fontSize: 24
          ),
          ),
        Expanded(
  child: ListView.builder(
    itemCount: _filteredPlaces.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchBookPage(place: _filteredPlaces[index], toController: null,),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text(
                _filteredPlaces[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
      );
    },
  ),
),


        ],
      ),
    );
  }
}

