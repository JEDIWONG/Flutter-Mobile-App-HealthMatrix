import "package:flutter/material.dart";

class ListItem extends StatelessWidget{
  const ListItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
            color: Color.fromARGB(255, 38, 38, 38),
            offset: Offset(0.5, 0.6),
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