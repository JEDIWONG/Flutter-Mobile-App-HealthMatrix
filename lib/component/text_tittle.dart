import 'package:flutter/material.dart';
import 'package:health_matrix/style/style.dart';

class TextTittleLeft extends StatelessWidget{
  const TextTittleLeft({
    super.key,
    required this.title,
    required this.desc
  });

  final String title; 
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child : Padding(
              padding:  const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(title,style : CustomStyle.largeHeading,),
            ),
          ),
          
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:  const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Text(desc, style: CustomStyle.smallText,),
            ),
          ),
        ],
      );
  }

}