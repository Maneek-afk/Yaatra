import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingPage extends StatefulWidget {
  final String imageAsset;
  final String cityName;

  

   BookingPage({
    Key? key,
    required this.imageAsset,
    required this.cityName,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController departureController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  
  Future bookingDetail(String from,String to,String departure, int passenger) async {
    await FirebaseFirestore.instance.collection('Bookings').add({
      'from': from,
      'to': to,
      'departure': departure,
      'passenger': passenger
    });
  }

  @override
  void initState() {
    super.initState();
    toController.text = widget.cityName;
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    departureController.dispose();
    passengerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus Ticket"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              
              const SizedBox(height: 100,),
              //from textfield
              SizedBox(
                height: 50,
                child: TextFormField(
                 
                  initialValue: 'Kathmandu',  // Provide an initial value
                  decoration: const InputDecoration(
                    labelText: 'From',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.location_on_rounded,
                    ),
                  ),
                ),
              ),

        
              const SizedBox(height: 30),
        
              //to textfield
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: toController,
                  decoration: const InputDecoration(
                    labelText: 'To',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.add_location_alt_outlined,
                    ),
                  ),
                ),
              ),
        
               const SizedBox(height: 30),
              //departure textfield
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: departureController,
                  decoration: const InputDecoration(
                    labelText: 'Departure',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
        
              const SizedBox(height: 30),
        
              //to textfield
               SizedBox(
                height: 65,
                child: TextFormField(
                  controller: passengerController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    labelText: 'Passenger',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.boy_rounded,
                    ),
                  ),
                ),
              ),
        
               ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'notification');
          bookingDetail(
            widget.cityName, 
            toController.text.trim(), 
            departureController.text.trim(), 
            int.parse(passengerController.text.trim())
          );

        },
        child: const Text('Book'),
            ),
        
            ],
          ),
        ),
      ),
    );  
  }
  Future<void>_selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2025)
      );
      if (_picked !=null){
        setState(() {
          departureController.text=_picked.toString().split(" ")[0];
        });
      }
  }
}
