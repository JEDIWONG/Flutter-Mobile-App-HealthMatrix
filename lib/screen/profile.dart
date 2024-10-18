import 'package:flutter/material.dart';
import 'package:health_matrix/component/list_item.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 50),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  offset: Offset(0, 1),
                  blurStyle: BlurStyle.normal,
                  color: Colors.grey,
                
                )
              ]
            ),
            child:  Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(onPressed: (){}, child: const Text("Edit")),
                ),
                const ListTile(
                  leading: Icon(Icons.account_box_rounded),
                  title: Text("Wong Zhi Kin"),
                ),
                const ListTile(
                  leading: Icon(Icons.cake_rounded),
                  title: Text("22 Years Old"),
                ),
                const ListTile(
                  leading: Icon(Icons.male),
                  title: Text("Male"),
                ),
                const ListTile(
                  leading: Icon(Icons.location_city_rounded),
                  title: Text("Ipoh, Perak"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,0,0,30),
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: const Column(
              children: [
               ListItem(title: "Help", icon: Icons.live_help_rounded),
               ListItem(title: "Setting", icon: Icons.settings),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              fixedSize: Size(MediaQuery.sizeOf(context).width-100, 50),
              side: const BorderSide(
                color: Colors.red,
              )
            ),
            child: const Text("Log Out"))
        ],
      ),

    );
  }
}