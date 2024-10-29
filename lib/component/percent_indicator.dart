import 'package:flutter/material.dart';

class SimpleStepIndicator extends StatelessWidget {
  const SimpleStepIndicator({required this.actualStep, this.steps=3,super.key});

  final int actualStep;//update by setState of parent Widget,by hooks, Bloc etc.
  final int steps; //can also be static const


  static const width = 200.0;
  static const colorSuccess = Colors.green;
  static const colorEmpty = Colors.grey;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var step in List.generate(steps, (index) => index))
                  ...[ Icon(
                    Icons.circle,
                    color: step <= actualStep ?  colorSuccess: colorEmpty,
                    size: step <= actualStep ? 24.0 : 16.0,
                  ),
                    SizedBox(
                      width: steps-1 == step?0:((width-20)/steps+3),
                      child: Divider(
                        color: step < actualStep?colorSuccess: colorEmpty,
                        thickness: 2,
                      ),
                    ),

                  ]
              ],

            )
          ],
        ),
      ),
    );
  }

}
