import 'package:flutter/material.dart';
import 'package:health_matrix/component/layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home":(context)=>const AppLayout(),
        //"/onboarding":(context)=>const Onboarding(),
      },
    );
  }
}
