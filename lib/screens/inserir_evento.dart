import 'package:flutter/material.dart';

class Event {
  String name;
  DateTime date;
  TimeOfDay time;
  String location;
  String description;

  Event(
      {required this.name,
      required this.date,
      required this.time,
      required this.location,
      required this.description});
}

class InserirAlertaScreen extends StatefulWidget {
  InserirAlertaScreen({Key? key}) : super(key: key);

  @override
  _InserirAlertaScreenState createState() => _InserirAlertaScreenState();
}

class _InserirAlertaScreenState extends State<InserirAlertaScreen> {
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
      firstDate: DateTime(1900),
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
      Future.delayed(const Duration(seconds: 2), () {
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
          const SnackBar(
            content: Text('Alerta inserido! estamos buscando ajuda para você!'),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: const Text('Inserir Alerta',
            style: TextStyle(
                color: Colors.red,
                fontFamily: 'Dm_sans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Qual sua emergência?',
                      fillColor: Colors.white),
                  style: const TextStyle(
                      color: Colors.red, fontFamily: 'Dm_sans', fontSize: 20.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Para podermos ajudar, escreva sua emergencia.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Data: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontFamily: 'Dm_sans',
                            fontSize: 20.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Selecione a data',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Dm_sans',
                              fontSize: 20.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hora: ${_selectedTime.hour}:${_selectedTime.minute}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontFamily: 'Dm_sans',
                            fontSize: 20.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('Selecione a hora',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Dm_sans',
                              fontSize: 20.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                      labelText: 'Localização', fillColor: Colors.white),
                  style: const TextStyle(color: Colors.red),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor adicione uma localização';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Descrição', fillColor: Colors.white),
                  style: const TextStyle(color: Colors.red),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor adicione uma descrição';
                    }
                    return null;
                  },
                  maxLines: 2,
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: _creatingEvent ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: _creatingEvent
                            ? const CircularProgressIndicator()
                            : const Text('Insira o Alerta',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Dm_sans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ))),
                    ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Resetar Campos',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dm_sans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
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
