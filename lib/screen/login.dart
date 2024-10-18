import 'package:flutter/material.dart';
import 'package:health_matrix/component/alt_login.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/screen/registration.dart';
import 'package:health_matrix/style/style.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            const PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Sign In Account"),
            Align(
              alignment: Alignment.centerLeft,
              child : Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Text("Welcome Back,",style : CustomStyle.largeHeading,),
              ),
            ),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text("Its good to see you here again", style: CustomStyle.smallText,),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(30, 50, 60, 0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                      child: Text("Forgot Password ?",style: CustomStyle.link,),
                    ),
                  ),
                  
                  const RoundButton(title: "Sign In", onPressed: AppLayout(), bgColor: Colors.amber, frColor: Colors.white),
                  
                  const AltLogin(padX: 0, padY: 0),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Not Yet A User ?",style: CustomStyle.mediumHeading,),
                  ),
                  const RoundButton(title:"Create New Account", onPressed: Registration(), bgColor: Colors.green, frColor: Colors.white)
                ],
              ),
            ), 
            
          ],
        ),
       )
    );
  }
  
}