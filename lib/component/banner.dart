import 'package:flutter/material.dart';
import 'package:health_matrix/style/style.dart';

class PageBanner extends StatelessWidget{
  const PageBanner({super.key, required this.imgUrl, required this.title});

  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(bottom: 10),
      height: 200,
      
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat
        )
      ),

      child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(title,style: CustomStyle.bannerTitle,),
          ),
    );
  }
}