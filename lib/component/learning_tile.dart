
import 'package:flutter/material.dart';

class LearningTile extends StatelessWidget{
  const LearningTile({
    super.key,
    required this.step,
    required this.title,
    required this.imgUrl
  });

  final String step;
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1),
      
      child: ListTile(

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
          child: Align(
            alignment: Alignment.center,
            child: Text(step),
          ),
        ),
        title: SizedBox(
          width: double.infinity,
          height: 60,
          child: Image.asset(imgUrl,fit: BoxFit.cover,),
        ),
        subtitle: Align(
          alignment: Alignment.centerRight,
          child:  Text(title),
        ),
        trailing: const Icon(Icons.navigate_next),
      ),
    );
  }
}