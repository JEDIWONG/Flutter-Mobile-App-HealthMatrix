import 'package:flutter/material.dart';
import 'package:health_matrix/component/custom_button.dart';

class AltLogin extends StatelessWidget{
  const AltLogin({super.key, required this.padX, required this.padY});

  final double padX; 
  final double padY;
  
  @override
  Widget build(Object context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(padX, padY, padX, padY),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,30,0,0),
            child: Divider(height: 1,thickness: 2,color: Colors.amber),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,10,0,50),
            child: Text("Or Sign In Using"),
          ),
          
          AltLoginButton(title: "Sign in With Google", imgUrl: "assets/icons/google.png"),
          Padding(padding: EdgeInsets.all(10)),
          AltLoginButton(title: "Sign in With Microsoft", imgUrl: "assets/icons/google.png"),
        ],
      ),
    );
  }

  
}