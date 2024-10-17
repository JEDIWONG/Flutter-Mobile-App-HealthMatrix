import 'package:flutter/material.dart';
import 'package:health_matrix/style/style.dart';

class PageBanner extends StatelessWidget{
  const PageBanner({super.key, required this.imgUrl, required this.title});

  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(imgUrl,height: 200,),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(title,style: CustomStyle.pageTitle,),
          )
          
        ],
      ),
    );
  }
  
}