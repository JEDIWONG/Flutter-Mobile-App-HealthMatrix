import "package:flutter/material.dart";

class ListItem extends StatelessWidget{
  const ListItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
            color: Color.fromARGB(255, 227, 227, 227),
            offset: Offset(1, 1),
          )
        ]
      ),
      child:  ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
  
}