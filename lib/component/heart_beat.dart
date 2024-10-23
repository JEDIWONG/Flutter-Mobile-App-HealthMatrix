import 'package:flutter/material.dart';

class HeartBeat extends StatelessWidget{
  const HeartBeat({super.key, required this.bpm});

  final int bpm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 26, 26, 26),
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
            title:Text("Heartbeat Rate",style: TextStyle(color: Color.fromARGB(255, 248, 152, 184),fontWeight: FontWeight.bold,fontSize: 24),),
            trailing: Icon(Icons.navigate_next_rounded,color: Color.fromARGB(255, 248, 152, 184),),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child:  Row(
              children: [
                Text("$bpm",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 248, 152, 184))),
                const SizedBox(width: 5,),
                const Text("bpm",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
              ],
            ),
          ),
          
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  color: Colors.green,
                  
                ),
                const SizedBox(width: 5,),
                const Text("Normal",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                Container(
                  width: MediaQuery.sizeOf(context).width/3,
                  margin: const EdgeInsets.only(top: 5,left: 0),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 152, 184),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text("14:20 PM",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}