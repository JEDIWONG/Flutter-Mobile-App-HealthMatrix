import 'package:health_matrix/model/guide.dart';

class AppData {
  static List<Guide> courseData = [
    Guide(
      title: "Health Monitor",
      imgUrl: "assets/images/onboarding_last.jpg",
      totalSteps: 3,
      procedure: [
        {
          "Title": "Preparation Before Taking the Measurement",
          "Desc": "d",
          "imgUrl": "assets/images/onboarding_last.jpg",
        },
        {
          "Title": "Step 2: Record your data",
          "Desc": "Record the heart rate in the app.",
          "imgUrl": "assets/images/onboarding_last.jpg",
        },
        {
          "Title": "Step 3: Monitor your progress",
          "Desc": "Track your heart rate over time to monitor progress.",
          "imgUrl": "assets/images/onboarding_last.jpg",
        },
      ],
    ),
  ];
}
