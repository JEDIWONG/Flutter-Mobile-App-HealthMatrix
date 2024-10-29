import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/text_tittle.dart';

class Chapter extends StatelessWidget{
  const Chapter({super.key, required this.imgUrl, required this.title, required this.content});

  final String imgUrl; 
  final String title;
  final List <String> content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageBanner(imgUrl: imgUrl, title: ""),
            TextTittleLeft(title: title, desc: "Brief Fact You Need To Know About"),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child:Column(
                children: 
                  content.map((p){
                    
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1,1),
                            color: Colors.black,
                            blurRadius: 0.5,
                            blurStyle: BlurStyle.normal,
                          )
                        ]
                      ),
                      child: ListTile(
                        
                        leading: const Icon(Icons.fact_check_rounded,color: Colors.deepPurpleAccent,),
                        title: Text(p,style: const TextStyle(fontSize: 18),),
                      ),
                    );
                  }).toList(),
              )
            )

          ],
        ),
      ),
    );
  }
}