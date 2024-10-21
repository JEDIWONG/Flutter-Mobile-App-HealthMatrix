import 'package:flutter/material.dart';

class MetricTag extends StatelessWidget{
  const MetricTag({
    super.key,
    required this.title,
    required this.normal
  });

  final String title; 
  final bool normal;

  Color getColor(){
    Color color=Colors.red;
    
    if(normal==true){
      color = Colors.green;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 150,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child:  Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10)

          ),
          Text(title,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),), 
        ],
      ),
    );
  }
}