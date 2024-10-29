
import 'package:flutter/material.dart';
import 'package:health_matrix/screen/chapter.dart';

class LearningTile extends StatelessWidget{
  const LearningTile({
    super.key,
    required this.step,
    required this.title,
    required this.imgUrl,
    required this.content,
  });

  final String step;
  final String title;
  final String imgUrl;
  final List <String> content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chapter(imgUrl: imgUrl, title: title, content: content)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 88, 88, 88),
              blurRadius: 0.3,
              blurStyle: BlurStyle.normal,
              offset: Offset(1, 1),
            )
          ],
          image: DecorationImage(image: AssetImage(imgUrl),fit: BoxFit.cover)
        ),
        
        child: ListTile(
          
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          tileColor: Colors.white,
          textColor: Colors.amber,
          iconColor: Colors.amber,
          leading: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.deepPurpleAccent,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              shadows: [ 
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 3
                )
              ]
            ),
          ),
          trailing: const Icon(Icons.navigate_next,shadows: [Shadow(offset: Offset(1, 1),blurRadius: 1, color: Colors.black)],),
        ),
      ),
    );
  }
}