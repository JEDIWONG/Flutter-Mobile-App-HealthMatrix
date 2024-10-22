import "package:flutter/material.dart";
import "package:health_matrix/component/metric_bar.dart";
import "package:health_matrix/component/metric_tag.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

class HealthMonitor extends StatelessWidget{
  const HealthMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.fromLTRB(3,10,3,0),
      padding: const EdgeInsets.fromLTRB(0,30,0,30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/dashboard/monitor.png"),
          fit: BoxFit.cover
        )
      ),
      child:  Row(
        children: [
          const Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    MetricTag(title: "Exercise",normal: true,),
                    MetricTag(title: "Hydration",normal: true,),
                    MetricTag(title: "Blood Pressure",normal: true,),
                    
                  ],
                ),
              )
              
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 46, 132),
                  shape: BoxShape.circle,
                ),
                child: CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 10.0,
                  percent: 0.8,
                  center: const Text("80%",style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.black,
                  progressColor: Colors.amber,
                ),
              ),
              const MetricBar(title: "Status", desc: "Healthy"),

            ],
          )
          
          
        ],
      ),
    );
  }
  
}