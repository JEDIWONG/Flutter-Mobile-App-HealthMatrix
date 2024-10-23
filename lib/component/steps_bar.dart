import 'package:flutter/material.dart';

class StepsBar extends StatelessWidget {
  const StepsBar({super.key, required this.index, required this.len});

  final String index;
  final int len;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(len, (i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: i == int.parse(index) ? const Color.fromARGB(255, 253, 194, 0):Colors.green , // Dynamic color based on index
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                (i + 1).toString(), // Incrementing the index
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
