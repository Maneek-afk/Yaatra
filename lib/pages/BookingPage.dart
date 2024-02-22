import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingPage extends StatefulWidget {
  final String imageAsset;
  final String cityName;

  const BookingPage({
    Key? key,
    required this.imageAsset,
    required this.cityName,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cityNameController.text = widget.cityName;
  }

  @override
  void dispose() {
    _cityNameController.dispose();
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
                  initialValue: 'Kathmandu',
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
                  controller: _cityNameController,
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
                  controller: _dateController,
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
          // Add your search functionality here
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
          _dateController.text=_picked.toString().split(" ")[0];
        });
      }
  }
}
