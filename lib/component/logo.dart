import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      width: 100,
      height: 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo_01.png"),

        ),
      ),
      child: const Align(
        alignment: Alignment(0,-10),
        child: Text("Health Matrix",style: TextStyle(fontSize: 12,color: Colors.green),),
      )
      
    );
  }
  
}