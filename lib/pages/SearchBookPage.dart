import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBookPage extends StatefulWidget {
  final String place;
  final TextEditingController? toController; 

  const SearchBookPage({required this.place, required this.toController});

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  late TextEditingController _departureController;

  @override
  void initState() {
    super.initState();
    _departureController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Ticket to ${widget.place}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 100,),
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
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: widget.toController,
                  initialValue: widget.place,
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
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: _departureController,
                  decoration: const InputDecoration(
                    labelText: 'Departure',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              const SizedBox(height: 30),
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
                onPressed: () async {
                  // Call the bookingDetail method
                  // Pass the values from text fields to your bookingDetail method

                  // Navigate to the Notification Page
                  Navigator.pushNamed(context, 'notification');
                },
                child: const Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2025)
    );
    if (_picked != null){
      setState(() {
        _departureController.text = _picked.toString(); // Display selected date
      });
    }
  }
}
