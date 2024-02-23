import 'package:cloud_firestore/cloud_firestore.dart';

String fromString = ""; // Declare global variables
String toString = "";
String departureString = "";
String passengerString = "";


Future<void> retrieveBookingDetails() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Bookings').get();
    
    // Iterate through the documents and extract data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      String from = doc['from'];
      String to = doc['to'];
      String departure = doc['departure'];
      int passenger = doc['passenger'];
      
      // Now you can save these data into strings or any other variables
      String fromString = from;
      String toString = to;
      String departureString = departure;
      String passengerString = passenger.toString(); // Convert int to string
      // You can process or use these strings as per your requirement
    }
  } catch (e) {
    print("Error retrieving booking details: $e");
    // Handle error
  }
}
