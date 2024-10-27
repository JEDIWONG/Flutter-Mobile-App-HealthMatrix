import 'package:flutter/material.dart';
import 'package:health_matrix/component/edu_card.dart';
import 'package:health_matrix/model/data.dart';
import 'package:health_matrix/screen/guide.dart';
import 'package:health_matrix/screen/learning.dart';
import 'package:health_matrix/screen/meals_planning.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              decoration: const BoxDecoration(
                color: Colors.black, 
                
              ),
              child: const ListTile(
                leading: Icon(Icons.web_rounded,color: Colors.deepPurpleAccent,),
                title: Text("Useful Features",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.amber),),
                subtitle: Text("Legend Said Prepare Umbrella Before Rain",style: TextStyle(color: Colors.white),),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.sizeOf(context).width,
              
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Colors.white,
              child: const Column(
                children: [
                  EduCard(
                    title: "Meals Planning",
                    imgUrl: "assets/images/info_page/meal.png",
                    onPressed: MealsPlanning(),
                  ),
                  SizedBox(height: 20),
                  EduCard(
                    title: "Knowledge",
                    imgUrl: "assets/images/info_page/knowledge.png",
                    onPressed: Learning(),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.normal,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              child: Column(
                children: [
                  
                  const ListTile(
                    leading: Icon(Icons.info_rounded,color: Colors.amber,),
                    title: Text(
                      "How To Use",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white,),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
