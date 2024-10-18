import 'package:flutter/material.dart';
import 'package:health_matrix/component/alt_login.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/screen/first_time_setup.dart';

class Registration extends StatelessWidget{

  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Creating Account"),      
            const TextTittleLeft(title: "Welcome Here", desc: "Few Steps To Go"),
            
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.fromLTRB(50,0,50,0),
              
              child: Column(
                
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.account_box_rounded),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Phone No.",
                      prefixIcon: Icon(Icons.phone_android_rounded),
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.fromLTRB(0,30,0,0),
                    child: RoundButton(title: "Submit", onPressed: FirstTimeSetup(), bgColor: Colors.amber, frColor: Colors.white)
                  ),
                ],
              ),
            ),
            const AltLogin(padX: 30,padY: 0,)
          ],
          
        ),
      )
    );
  }
}

