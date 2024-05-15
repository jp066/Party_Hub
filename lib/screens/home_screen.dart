import 'package:flutter/material.dart';
import 'package:sos_central/theme/app_colors.dart';
import 'package:sos_central/core/main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.newspaper,
                  color: Color.fromARGB(255, 255, 50, 47)),
            ),
            Tab(
              icon: Icon(
                Icons.cloud_outlined,
                color: Color.fromARGB(255, 255, 50, 47),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text('Tela Notícias'),
          ),
          Center(
            child: Text('Tela Clima'),
          )
        ],
      ),
    );
  }
}
