import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/text_tittle.dart';

class Learning extends StatelessWidget{
  const Learning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageBanner(imgUrl: "assets/images/bg_01.jpg", title: "Guide"),
          const TextTittleLeft(title: "Learning Modules", desc: "Knowledges starts here"),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 300,
            child: Column(
              children:  [
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  tileColor: Colors.black,
                  textColor: Colors.white,
                  iconColor: Colors.amber,
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.amber,
                    ),
                    child:  const Align(
                      alignment: Alignment.center,
                      child: Text("1"),
                    ),
                  ),
                  title: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset("assets/images/bg_01.jpg",fit: BoxFit.cover,),
                  ),
                  subtitle: const Align(
                    alignment: Alignment.centerRight,
                    child:  Text("Introduction To NCDs"),
                  ),
                  trailing: const Icon(Icons.navigate_next),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  
}