import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/screen/login.dart';
import 'package:health_matrix/screen/registration.dart';
import 'package:health_matrix/style/style.dart';

class Auth extends StatelessWidget{
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Lets Get Started, "),
          Container(
            padding: const EdgeInsets.fromLTRB(20,30,20,0),
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                
                const TextTittleLeft(title: "First of All", desc: "Lets Move Into An Account !"),
                
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 10),
                    child: Text("For Existing User,", style: CustomStyle.mediumText,),           
                  )
                ),
                const RoundButton(title: "Sign In Here", onPressed: Login(), bgColor: Colors.green, frColor: Colors.white),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 10),
                    child: Text("If You Are New,", style: CustomStyle.mediumText,),           
                  )
                ),
                const RoundButton(title: "Register Account", onPressed: Registration(), bgColor: Colors.green, frColor: Colors.white),
              ],
            ),
          )
        ],
      )
    );
  }

}