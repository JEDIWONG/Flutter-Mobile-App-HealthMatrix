import 'package:flutter/material.dart';
import 'package:health_matrix/component/logo.dart';
import 'package:health_matrix/screen/home.dart';
import 'package:health_matrix/screen/info.dart';
import 'package:health_matrix/screen/notfication.dart';
import 'package:health_matrix/screen/profile.dart';
import 'package:permission_handler/permission_handler.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});
  
  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {

  int _selectedIndex = 0;

  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;

    if (!granted) {
      granted = await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }

    return granted;
  }

  Future<void> initPlatformState() async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      // Permission not granted; notify user
    }

    if (!mounted) return;
  }

  static List<Widget> pageList = [
    const Home(),
    const Info(),
    const Profile(age: 22, gender: "Male", weight: 45, height: 170),
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

        leading: const Text(""),
        
        title: Logo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notfication(noMsg: 1,)));
            },
          ),
          
        ],
        
      ),
      body: pageList.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _switchPage, 
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.black,
      
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_rounded),
            label: 'Vitals',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.free_breakfast_rounded),
            label: "Features"
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