import 'package:flutter/material.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/screen/auth.dart';
import 'package:health_matrix/screen/login.dart';
import 'package:health_matrix/screen/onboarding.dart';
import 'package:health_matrix/screen/registration.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: "/onboarding",
      routes: {
        "/home":(context)=>const AppLayout(),
        "/onboarding":(context)=>const Onboarding(),
        "/login":(context)=> const Login(),
        "/auth":(context)=> const Auth(),
        "/registration":(context)=>const Registration(),
      },
    );
  }
}