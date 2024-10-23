import "package:flutter/material.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

class HealthMonitor extends StatelessWidget{
  const HealthMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 26, 26, 26),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
            color: Colors.amber,
            offset: Offset(1, 3),
          )
        ]
      ),
      child: Column(
        children: [
          
          const ListTile(
            leading: Icon(Icons.monitor_heart_rounded,color: Colors.lightGreen,),
            title:Text("Status",style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 24),),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child:  CircularPercentIndicator(
              startAngle: 220,
              radius: 60.0,
              lineWidth: 5.0,
              percent: 0.8,
              center:Container(
                margin: const EdgeInsets.only(top: 30),
                child:  const Column(
                  children: [
                    Text("80 %",style:  TextStyle(color: Colors.amber,fontSize: 22),),
                    Text("Overall",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),), 
                  ],
                ),
              ),
              backgroundColor: Colors.black,
              progressColor: Colors.amber,
            ),

          ),
          
          
        ],
      ),
    );
  }
  
}