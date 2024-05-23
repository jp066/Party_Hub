import 'package:flutter/material.dart';
import 'package:sos_central/main/bottom_nav_bar.dart';
import 'package:sos_central/screens/chat_screen.dart';
import 'package:sos_central/screens/home_screen.dart';
import 'package:sos_central/screens/login_screen.dart';
import 'package:sos_central/screens/perfil_screen.dart';
import 'package:sos_central/screens/pesquisa_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
  }

  class _MainScreenState extends State<MainScreen> {
    late final PageController _pageController;
    int _pageIndex = 0;

    @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex); 
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: _pageController,
          onPageChanged: (value){
            setState(() {
              _pageIndex = value;
            });
          },
          children: [
            HomeScreen(),
            SearchScreen(),
            ChatScreen(),
            PerfilScreen(),
          ],
        ),
      bottomNavigationBar: BottomNavBar(currentIndex: _pageIndex, onTap: (value){
        _pageController.jumpToPage(value);
      },),
      );
    }
  }