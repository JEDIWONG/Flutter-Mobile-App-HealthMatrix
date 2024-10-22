import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Blood Tester"),
          GuideSteps(),
        ],
      ),
    );
  }
}

class GuideSteps extends StatefulWidget {
  const GuideSteps({super.key});

  @override
  State<GuideSteps> createState() => GuideStepsState();
}

class GuideStepsState extends State<GuideSteps> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        
        currentStep: index,
        onStepContinue: () {
          if (index < 10) {
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
        steps: [
          Step(
            title: const Text("Go Buy A gun"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/test_image.jpg",
                        ),
                      )),
                  const Text("You should Kill Yourself"),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Go Buy A gun"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/test_image.jpg",
                        ),
                      )),
                  const Text("You should Kill Yourself"),
                ],
              ),
            ),
          ),
        ],
        // Custom control buttons (Next and Back)
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            children: <Widget>[
              // Next button
              ElevatedButton(
                onPressed: controls.onStepContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 0, 254),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Next'),
              ),
              const SizedBox(width: 8),
              // Back button
              if (index > 0)
                ElevatedButton(
                  onPressed: controls.onStepCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: Colors.purple
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
