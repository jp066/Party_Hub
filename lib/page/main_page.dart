import 'package:flutter/material.dart';
import 'package:sos_central/screens/chat_screen.dart';
import 'package:sos_central/screens/inserir_evento.dart';
import 'package:sos_central/screens/perfil_screen.dart';
import 'package:sos_central/screens/pesquisa_screen.dart';
import 'package:sos_central/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InserirAlertaScreen()),
          );
        },
        child: Icon(Icons.add, color: Color.fromARGB(255, 255, 50, 47)),
        shape: CircleBorder(),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: IconTheme(
          data: IconThemeData(color: Color.fromARGB(255, 255, 50, 47)),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.travel_explore_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                ),
                SizedBox(width: 40.0),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle_outlined),
                  onPressed: () {/*
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );*/
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
