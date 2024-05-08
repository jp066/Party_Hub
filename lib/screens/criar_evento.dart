import 'package:flutter/material.dart';

class Event {
  String name;
  DateTime date;
  TimeOfDay time;
  String location;
  String description;

  Event({required this.name, required this.date, required this.time, required this.location, required this.description});
}
class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late DateTime _selectedDate = DateTime.now();
  late TimeOfDay _selectedTime = TimeOfDay.now();
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;
  bool _creatingEvent = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _creatingEvent = true;
      });

      // Simulate a delay to mimic server request
      Future.delayed(Duration(seconds: 2), () {
        // Form is validated, you can process the data
        Event newEvent = Event(
          name: _nameController.text,
          date: _selectedDate,
          time: _selectedTime,
          location: _locationController.text,
          description: _descriptionController.text,
        );

        // Here you can save the event or send it to an API, for example
        // For now, let's just print it
        print(newEvent);

        // After processing the data, you can navigate to another page or show a confirmation dialog
        // For now, let's just clear the form and show a snackbar
        _nameController.clear();
        _locationController.clear();
        _descriptionController.clear();
        setState(() {
          _selectedDate = DateTime.now();
          _selectedTime = TimeOfDay.now();
          _creatingEvent = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Event created successfully!'),
          ),
        );
      });
    }
  }

  void _resetForm() {
    _nameController.clear();
    _locationController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedDate = DateTime.now();
      _selectedTime = TimeOfDay.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 6, 225, 233), Color.fromARGB(255, 98, 186, 207)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Event Name', fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the event name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Time: ${_selectedTime.hour}:${_selectedTime.minute}',
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectTime(context),
                      child: Text('Select Time'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location', fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description', fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _creatingEvent ? null : _submitForm,
                      child: _creatingEvent ? CircularProgressIndicator() : Text('Create Event'),
                    ),
                    ElevatedButton(
                      onPressed: _resetForm,
                      child: Text('Reset Form'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}