import 'package:flutter/material.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/style/style.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,30,0,0),
                  child: Divider(height: 1,thickness: 2,color: Colors.amber),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,50),
                  child: Text("Or Sign In Using"),
                ),
                
                const AltLoginButton(title: "Sign in With Google", imgUrl: "assets/icons/google.png"),
                const Padding(padding: EdgeInsets.all(10)),
                const AltLoginButton(title: "Sign in With Microsoft", imgUrl: "assets/icons/google.png"),
                
              ],
            ),
          ), 
          
        ],
      )
    );
  }
  
}