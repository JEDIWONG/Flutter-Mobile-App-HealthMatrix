import 'package:flutter/material.dart';

class Hydration extends StatelessWidget{
  const Hydration({super.key, required this.currMl, required this.goalMl});

  final int currMl; 
  final int goalMl;

  int getWaterLeft(){
    int waterLeft = goalMl - currMl;

    return waterLeft;
  }

  int getCup(int ml) {
    double cup = ml / 240;
    return cup.floor();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
            color: Color.fromARGB(255, 49, 49, 49),
            offset: Offset(0, 1),
          )
        ]
      ),
      child: Column(
        children: [
          const ListTile(
            title: Text("Water Intake",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),),
            trailing: Icon(Icons.navigate_next_rounded,color: Colors.blue,),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child:  Row(
              children: [
                Text("$currMl",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.blue)),
                const SizedBox(width: 5,),
                const Text("ml /",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
                const SizedBox(width: 5,),
                Text("$goalMl",style: const TextStyle(fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic))
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Text("${getCup(currMl)}",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.blue)),
                const SizedBox(width: 5,),
                const Text("Cups /",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
                const SizedBox(width: 5,),
                Text("${getCup(goalMl)}",style: const TextStyle(fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic))

              ],
            ),
          ), 
        
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Text("${getWaterLeft()} ml Left", style: const TextStyle(color: Colors.orange, fontSize: 12)),
                Container(
                  width: MediaQuery.sizeOf(context).width/3,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text("Good Luck!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
}