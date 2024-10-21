import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';

class Guide extends StatelessWidget{
  const Guide({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Blood Tester"),
          GuideSteps(),
        ],
      ),
    );
  }
  
}

class GuideSteps extends StatefulWidget{
  const GuideSteps({super.key});

  @override
  State<GuideSteps> createState() =>GuideStepsState();

}

class GuideStepsState extends State<GuideSteps>{

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(

      currentStep: index,
      
      onStepContinue: (){
        if(index<=10){
          setState(() {
            index++;
          });
        }
      },
      onStepCancel: () {
        if(index>0){
          setState(() {
            index--;
          });
        }
      },
      onStepTapped: (value) {
        setState(() {
          index=value;
        });
      },
      steps:[
        Step(
          title:const Text("SOhai"),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  
                  child: Image.asset("assets/images/bg_01.jpg",width: 300,height: 100,),
                ),

                const Text("You should Kill Yourself"),
              ],
            ),
          )
        ),
      ]
    );
  }

}