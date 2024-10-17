import 'package:flutter/material.dart';
import 'package:health_matrix/screen/home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});
  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  static List<Widget> pageList = [
    const Home(),
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
        
  
      body: pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _switchPage, // Call the function to switch pages
        selectedItemColor: const Color.fromARGB(255, 255, 183, 0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Me"
          ),
        ],
      ),
    );
  }
}