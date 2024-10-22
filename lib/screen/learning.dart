import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/learning_tile.dart';
import 'package:health_matrix/component/text_tittle.dart';

class Learning extends StatelessWidget{
  const Learning({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        child: Column(
          children: [
            PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Knowledge"),
            TextTittleLeft(title: "Learning Modules", desc: "Knowledges starts here"),
            LearningTile(step: "1", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
            LearningTile(step: "2", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
            LearningTile(step: "3", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
            LearningTile(step: "1", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
            LearningTile(step: "2", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
            LearningTile(step: "3", title: "Introduction To NCDs", imgUrl: "assets/images/test_image.jpg"),
          ],
        ),
      ) 
    );
  }
  
}