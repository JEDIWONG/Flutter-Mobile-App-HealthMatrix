import 'package:flutter/material.dart';
import 'package:health_matrix/screen/onboarding.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: "/onboarding",
      routes: {
        "/onboarding":(context)=>const Onboarding(),
      },
    );
  }
}