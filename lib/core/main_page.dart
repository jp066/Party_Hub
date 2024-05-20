import 'package:flutter/material.dart';
import 'package:sos_central/core/bottom_nav_bar.dart';
import 'package:sos_central/features/bookmarks/pages/bookmarks_page.dart';
import 'package:sos_central/features/browse/browse_page.dart';
import 'package:sos_central/screens/home_screen.dart';
import 'package:sos_central/features/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
  }

  class _MainPageState extends State<MainPage> {
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
        body: PageView(
          controller: _pageController,
          onPageChanged: (value){
            setState(() {
              _pageIndex = value;
            });
          },
          children:const[
            HomePage(),
            BrowsePage(),
            BookmarksPage(),
            ProfilePage(),
          ],
        ),
      bottomNavigationBar: BottomNavBar(currentIndex: _pageIndex, onTap: (value){
        _pageController.jumpToPage(value);
      },),
      );
    }
  }
