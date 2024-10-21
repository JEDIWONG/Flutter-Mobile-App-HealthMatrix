import 'package:flutter/material.dart';
import 'package:health_matrix/screen/guide.dart';

class EduCard extends StatelessWidget{
  const EduCard({
    super.key,
    required this.title,
    required this.imgUrl,
  });

  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Guide()));}, 
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: BoxFit.cover
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              blurStyle: BlurStyle.normal,
              color: Colors.black,
              offset: Offset(0, 1),
            )
          ]
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(title,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.amber),),
        ),
      ),
    );
  }

}