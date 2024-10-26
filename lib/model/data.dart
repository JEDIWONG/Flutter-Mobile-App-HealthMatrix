import 'package:health_matrix/model/guide.dart';
import 'package:health_matrix/model/user_steps.dart';


class AppData {
  static  UserSteps userSteps =UserSteps(currentSteps: 1000, goalSteps: 8000);

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
