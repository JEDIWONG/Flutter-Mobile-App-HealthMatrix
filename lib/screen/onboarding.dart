import 'package:flutter/material.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/screen/auth.dart';
import 'package:health_matrix/style/style.dart';

class Onboarding extends StatelessWidget{
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/images/bg_01.jpg"),
            fit: BoxFit.cover,
          ), 
        ),

        child: SafeArea(
          
          child:Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width-200,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 15, 15, 15),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/logo_01.png")
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      offset: Offset(1, 1),
                      color: Color.fromARGB(255, 43, 43, 43),
                    )
                  ]
                ),
                alignment: Alignment.topCenter,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Health Matrix",style: CustomStyle.logoTitle,),
                )
              ),

              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 250), 

                child: Column(
                  children: [
                    Text("Health First,",style:CustomStyle.onboardingTextLarge,),
                    Text("Everything Else Follows,",style:CustomStyle.onboardingTextSmall,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RoundButton(title: "Get Started", onPressed: Auth(), bgColor: Colors.deepPurpleAccent, frColor: Colors.white),
                    )

                  ],
                ),
              ),

            ],
          )
        ),
        ),
      );
  
  }
  
}