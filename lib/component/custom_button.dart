import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget{
  const RoundButton({
    super.key, 
    required this.title, 
    required this.onPressed,
    required this.bgColor, 
    required this.frColor,
  });

  final String title; 
  final Widget onPressed;
  final Color bgColor;
  final Color frColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>onPressed));}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: frColor,
        fixedSize:  Size(MediaQuery.sizeOf(context).width, 50),
        elevation: 5.0,
      ),
      child:  Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
    );
  }
}

class CustomBackButton extends StatelessWidget{
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: (){Navigator.pop(context);},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          fixedSize: const Size(100, 30),
          padding: const EdgeInsets.all(10),
        ),
        child: const Wrap(
          direction: Axis.horizontal,
          children: [
            Icon(
              Icons.navigate_before,
            ),
            Text("Back"),
          ],
        )
      ),
    );
  }
  
}

class AltLoginButton extends StatelessWidget{

  const AltLoginButton({
    super.key, 
    required this.title, 
    required this.imgUrl
  });

  final String title;
  final String imgUrl; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)), 
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 188, 188, 188),
              blurRadius: 1,
              blurStyle: BlurStyle.normal,
              spreadRadius: 1,
            )
          ]
        ),

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Image.asset(imgUrl,width: 50,height: 50,), 
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),) 
            ),
            
          ],
        ),
      ),
    );
  }

}