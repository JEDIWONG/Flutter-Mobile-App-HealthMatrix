import 'package:flutter/material.dart';

class StepsBar extends StatelessWidget {
  const StepsBar({super.key, required this.index, required this.len});

  final String index;
  final int len;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(len, (i) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: i == int.parse(index) ? Colors.deepPurpleAccent:Colors.green , // Dynamic color based on index
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                (i + 1).toString(), 
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 1,
                      color: Colors.black,
                      
                    )
                  ]
                ),
              ),
            ),
          );
        }),
      );
  }
}
