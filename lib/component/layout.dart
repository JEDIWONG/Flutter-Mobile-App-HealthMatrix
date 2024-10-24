import 'package:flutter/material.dart';
import 'package:health_matrix/component/logo.dart';
import 'package:health_matrix/screen/home.dart';
import 'package:health_matrix/screen/info.dart';
import 'package:health_matrix/screen/profile.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});
  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  static List<Widget> pageList = [
    const Home(),
    const Home(),
    const Info(),
    const Profile(),
  ];

  void _switchPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 1,
        leading: const Drawer(
          child: Icon(Icons.menu),
        ),
        title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
              child: Logo(),
            )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification button functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add settings button functionality here
            },
          ),
        ],
        
      ),
      body: pageList.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _switchPage, 
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
      
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_rounded),
            label: 'Vitals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_rounded),
            label: 'Medical Centre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Information"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "Profile"
          ),
        ],
      ),
    );
  }
}