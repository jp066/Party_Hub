import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sos_central/screens/chat_screen.dart';
import 'package:sos_central/screens/create_event_screen.dart';
import 'package:sos_central/screens/profile_screen.dart';
import 'package:sos_central/screens/explorer_screen.dart';
import 'package:sos_central/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExplorerScreen(),
    ProfileScreen(),
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
            MaterialPageRoute(builder: (context) => CreateEventPage()),
          );
        },
        child: Icon(Icons.add, color: Color(0xFFfca311)),
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFFfca311),
        child: IconTheme(
          data: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.event_note_outlined),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.travel_explore_outlined),
                  onPressed: () {
                    _onItemTapped(1);
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
