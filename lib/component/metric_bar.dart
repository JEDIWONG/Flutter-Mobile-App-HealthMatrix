import 'package:flutter/material.dart';

class MetricBar extends StatelessWidget{
  const MetricBar({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 196, 0),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10))
            ),

            child: Text(title),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width/4,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10))
            ),
            child: Text(desc),
          )
        ],
      ),
    );
  }
  
}