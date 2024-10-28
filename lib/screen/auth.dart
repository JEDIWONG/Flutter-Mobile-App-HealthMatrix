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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding_last.jpg"),
            
            alignment: Alignment.topCenter,
            ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          padding: const EdgeInsets.fromLTRB(20,20,20,100),
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
          ),
          child: Column(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 80),
                    child: TextTittleLeft(title: "First Step", desc: "Lets Move Into An Account"),
                  ),
                  const RoundButton(title: "Sign In", onPressed: Login(), bgColor: Colors.green, frColor: Colors.white),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.black,)
                        ),
                        Text(" Or "),
                        Expanded(
                          child: Divider(color: Colors.black,)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("If You Are New User",style:CustomStyle.smallHeading),
                    )
                  ),
                  const RoundButton(title: "Create Account", onPressed: Registration(), bgColor: Colors.blue, frColor: Colors.white),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

}