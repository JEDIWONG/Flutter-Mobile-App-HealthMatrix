import 'package:flutter/material.dart';
import 'package:health_matrix/component/edu_card.dart';
import 'package:health_matrix/screen/guide.dart';
import 'package:health_matrix/screen/learning.dart';

class Info extends StatelessWidget{
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 400,
              child: GridView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),

                children: const [
                  EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Learning(),),
                  EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Learning(),),
                  EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Learning(),),
                  EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Learning(),),

                ],
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.normal,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  )
                ]
              ),
              child: Column(
                children: [
                  const Text("How To Use"),
                  
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    child: GridView(
                      padding: const EdgeInsets.fromLTRB(10,10,10,100),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1/1.5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),

                      children: const [
                        EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Guide(),),
                        EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Guide(),),
                        EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Guide(),),
                        EduCard(title: "Learn Now", imgUrl: "assets/images/test_image.jpg",onPressed: Guide(),),

                      ],
                    ),
                  ),
                ],
              ),
            )
          
          ],
        ),
      )
    );
  }
  
}