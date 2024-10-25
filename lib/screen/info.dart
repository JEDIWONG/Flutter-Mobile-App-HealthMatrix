import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/edu_card.dart';
import 'package:health_matrix/model/data.dart';
import 'package:health_matrix/screen/guide.dart';
import 'package:health_matrix/screen/learning.dart';

class Info extends StatelessWidget{
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageBanner(imgUrl: "assets/images/info_page/bg.png", title: "Education"),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 500,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(1, -1),
                    color: Color.fromARGB(255, 181, 181, 181),
                  )
                ]
              ),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                ),

                children: const [
                  EduCard(title: "Meals Planning", imgUrl: "assets/images/info_page/meal.png",onPressed: Learning(),),
                  EduCard(title: "Exercise", imgUrl: "assets/images/info_page/exercise.png",onPressed: Learning(),),
                  EduCard(title: "Knowledge", imgUrl: "assets/images/info_page/knowledge.png",onPressed: Learning(),),
                  EduCard(title: "Data & Statistic", imgUrl: "assets/images/info_page/stats.png",onPressed: Learning(),),

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

                      children: AppData.courseData.map((guide) {
                          return EduCard(
                            title: guide.title,
                            imgUrl: guide.imgUrl,
                            onPressed: Guide(
                                title: guide.title,
                                imgUrl: guide.imgUrl,
                                totalSteps: guide.totalSteps,
                                procedure: guide.procedure,
                              ),
                          );
                        }).toList(),
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