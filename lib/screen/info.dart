import 'package:flutter/material.dart';
import 'package:health_matrix/component/edu_card.dart';

class Info extends StatelessWidget{
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 500,
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),

              children: const [
                EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg"),
                EduCard(title: "Learn Now", imgUrl: "assets/images/banner_01.jpg"),
                EduCard(title: "Learn Now", imgUrl: "assets/images/banner_01.jpg"),
                EduCard(title: "Learn Now", imgUrl: "assets/images/banner_01.jpg"),
                
              ],
            ),
          )
         
        ],
      ),
    );
  }
  
}