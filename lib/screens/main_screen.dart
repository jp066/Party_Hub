import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:party_hub/screens/chat_screen.dart';
import 'package:party_hub/screens/create_event_screen.dart';
import 'package:party_hub/screens/login_screen.dart';
import 'package:party_hub/screens/explorer_screen.dart';
import 'package:party_hub/screens/home_screen.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateEventPage()),
          );
        },
        child: Icon(Icons.add_circle_rounded,
         color: Color(0xFFfca311)),
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFFfca311),
        child: IconTheme(
          data: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          child: Padding(
            padding: EdgeInsets.all(5.0), // Decreased padding value
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.event_note_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.travel_explore_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExplorerScreen()),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
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
