import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EdamamApi {
  final String appId = 'ee085996'; // Replace with your Application ID
  final String appKey = '9a2f93e567168c4b6aeb70dc896edaf8'; // Replace with your Application Key

  Future<void> analyzeNutrition() async {
    final url = 'https://api.edamam.com/api/nutrition-details';
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "title": "Sample Recipe",
      "ingr": [
        "2 large eggs",
        "1 tablespoon olive oil",
        "1/2 cup chopped onions",
        "1/2 cup chopped bell peppers",
        "1/4 cup shredded cheese"
      ]
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data); // Handle the nutritional data
      } else {
        print('Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


class MealsPlanning extends StatelessWidget{
  const MealsPlanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("dwa")
          ],
        ),
      ),
    );
  }
  
}