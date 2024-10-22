import 'package:flutter/material.dart';

class CustomStyle {

  static TextStyle logoTitle = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 158, 69));

  static TextStyle onboardingTextSmall = const TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 249, 204, 114),
  );
  
  static TextStyle bannerTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.amber,
    fontStyle: FontStyle.italic,
    shadows: [
      Shadow(
        blurRadius: 1,
        color: Colors.black,
        offset: Offset(1, 1),
      )
    ]
  );
  
  static TextStyle pageTitle = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    shadows: [
      Shadow(
        blurRadius: 1,
        color: Colors.black,
        offset: Offset(1, 1), 
      )
    ]
  );

  static TextStyle largeHeading = const TextStyle(fontSize: 28,fontWeight: FontWeight.bold);
  static TextStyle mediumHeading = const TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
  static TextStyle smallHeading = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold);

  static TextStyle mediumText = const TextStyle(fontSize: 20);
  static TextStyle smallText = const TextStyle(fontSize: 16);

  static TextStyle lightText = const TextStyle(fontSize: 16,color: Colors.grey);

  static TextStyle link = const TextStyle(fontSize: 12,color: Colors.blue);

  
}