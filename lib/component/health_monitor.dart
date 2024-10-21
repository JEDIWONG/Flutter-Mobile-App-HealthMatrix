import "package:flutter/material.dart";
import "package:health_matrix/component/metric_tag.dart";

class HealthMonitor extends StatelessWidget{
  const HealthMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0,10,0,0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        color: Colors.blue,
        
      ),
      child:  const Row(
        children: [
          Column(
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
          )
        ],
      ),
    );
  }
  
}