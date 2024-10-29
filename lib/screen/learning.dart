import 'package:flutter/material.dart';
import 'package:health_matrix/component/learning_tile.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/model/data.dart';

class Learning extends StatelessWidget{
  const Learning({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        child: Container(
          
          decoration: const BoxDecoration(
            
            image: DecorationImage(
              image: AssetImage("assets/images/learning/bg.png"),
              alignment: Alignment.topCenter,
            )
          ),
          child:Container(
            margin: const EdgeInsets.only(top: 200),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            
            child:   Column(
              children: [
                const TextTittleLeft(title: "Learning Modules", desc: "Knowledges starts here"),
                Column(
                  children: 
                  AppData.chapterData.map((e){
                  
                    return LearningTile(step: e.index, title: e.title, imgUrl: e.imgUrl, content: e.content);
                  }).toList(),
                )
              ],
            ),
          )
        )
      ) 
    );
  }
  
}