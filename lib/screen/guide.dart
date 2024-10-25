import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';

class Guide extends StatelessWidget {
  const Guide({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.totalSteps,
    required this.procedure,
  });

  final String title;
  final String imgUrl;
  final int totalSteps;
  final List<Map<String, String>> procedure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageBanner(imgUrl: imgUrl, title: title),
            GuideSteps(procedure: procedure),
          ],
        ),
      )
    );
  }
}

class GuideSteps extends StatefulWidget {
  const GuideSteps({super.key, required this.procedure});

  final List<Map<String, String>> procedure;

  @override
  State<GuideSteps> createState() => GuideStepsState();
}

class GuideStepsState extends State<GuideSteps> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      child: Stepper(
        currentStep: index,
        onStepContinue: () {
          if (index < widget.procedure.length - 1) {
            setState(() {
              index++;
            });
          }
        },
        onStepCancel: () {
          if (index > 0) {
            setState(() {
              index--;
            });
          }
        },
        onStepTapped: (value) {
          setState(() {
            index = value;
          });
        },
        steps: widget.procedure.map((step) {
          return Step(
            title: Text(step['Title'] ?? 'Step Title'),
            content: Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      step["imgUrl"] ?? "assets/images/onboarding_last.jpg",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(step['Desc'] ?? 'Step Description'),
              ],
            ),
          );
        }).toList(),
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: controls.onStepContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 0, 254),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Next'),
              ),
              const SizedBox(width: 8),
              if (index > 0)
                ElevatedButton(
                  onPressed: controls.onStepCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: Colors.purple,
                  ),
                  child: const Text('Back'),
                ),
            ],
          );
        },
      ),
    );
  }
}
