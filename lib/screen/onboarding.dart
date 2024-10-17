import 'package:flutter/material.dart';
import 'package:health_matrix/screen/login.dart';

class Onboarding extends StatelessWidget{
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/images/test_image.jpg"),
            fit: BoxFit.cover,
          ), 
        ),

        child: SafeArea(
          child: Center(
          child:Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                }, 
                child: const Text("Get Started")
              )
            ],
          )
        ),
        ),
      ),
    );
  }
  
}