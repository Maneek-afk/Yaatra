import 'package:bus/pages/BookingPage.dart';
import 'package:flutter/material.dart';

class Scrollables extends StatelessWidget {
  final String imageAsset;
  final String cityName;

  const Scrollables({
    Key? key,
    required this.imageAsset,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200], // Change the color to match your design
          ),
          child: ClipRRect(

          borderRadius: BorderRadius.circular(20),child: GestureDetector(
          onTap: () {
            // Navigate to the next page when the image is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingPage(
                imageAsset: imageAsset,
                cityName: cityName,
              )),
            );
          },

            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration:const  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20), 
                    ),
                    color: Colors.grey,
                  ),
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cityName,
                        style:const  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
