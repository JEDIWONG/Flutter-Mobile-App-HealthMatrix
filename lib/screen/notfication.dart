import 'package:flutter/material.dart';

class Notfication extends StatelessWidget{
  const Notfication({super.key, required this.noMsg});

  final int noMsg;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
              tileColor: Colors.black,
              leading: const Icon(Icons.notifications_rounded,color: Colors.deepPurpleAccent,),
              title: const Text("Notification",style: TextStyle(color: Colors.amber,fontSize: 24,fontWeight: FontWeight.bold),),
              subtitle: Text("You have $noMsg unread message",style: const TextStyle(color: Colors.white),),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: const Column(
                children: [
                  ListTile(leading: Icon(Icons.message_rounded),title: Text("Welcome to Health Matrix"),subtitle: Text("Many features to explore"),),
                  ListTile(leading: Icon(Icons.water_drop_rounded,color: Colors.blue,),title: Text("Stay hydrated"),subtitle: Text("Dont forget to drink water"),trailing: Icon(Icons.done_rounded,color: Colors.green,),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.black,)
                        ),
                        Text("You have Reach Bottom of the list"),
                        Expanded(
                          child: Divider(color: Colors.black,)
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}