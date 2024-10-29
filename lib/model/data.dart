import 'package:health_matrix/model/guide.dart';
import 'package:health_matrix/model/user_steps.dart';
import 'package:health_matrix/model/user_water.dart';


class AppData {
  static  UserSteps userSteps =UserSteps(currentSteps: 1000, goalSteps: 8000);
  static UserWater userWater = UserWater(currentMl: 1000, goalMl: 3000);

  static List<Guide> courseData = [
    Guide(
      title: "Blood Pressure Monitor",
      imgUrl: "assets/images/learning/how_01/bg.png",
      totalSteps: 3,
      procedure: [
        {
          "Title": "Get Ready",
          "Desc": "Sit comfortably with your back supported, legs uncrossed, and feet flat on the floor. Rest your arm on a table at heart level.",
          "imgUrl": "assets/images/learning/how_01/s1.png",
        },
        {
          "Title": "Position the Cuff",
          "Desc": "Wrap the cuff around your upper arm, just above the elbow. Ensure it's snug but not too tight.",
          "imgUrl": "assets/images/learning/how_01/s2.png",
        },
        {
          "Title": "Take the Reading",
          "Desc": "Press the start button and remain still. The monitor will inflate the cuff and take a reading. Note the systolic and diastolic numbers.",
          "imgUrl": "assets/images/learning/how_01/s3.png",
        },
      ],
    ),
    Guide(
      title: "Blood Glucose Test Tool",
      imgUrl: "assets/images/learning/how_02/bg.png",
      totalSteps: 3,
      procedure: [
        {
          "Title": "Prepare Your Supplies",
          "Desc": "Gather your glucose meter, test strips, and a lancet. Wash your hands with warm water and dry them thoroughly.",
          "imgUrl": "assets/images/learning/how_02/s1.png",
        },
        {
          "Title": "Insert the Test Strip",
          "Desc": "Insert a test strip into the glucose meter. The meter will signal when it's ready for a blood sample.",
          "imgUrl": "assets/images/learning/how_02/s2.png",
        },
        {
          "Title": "Get a Blood Sample",
          "Desc": "Use the lancet to prick the side of your fingertip. Squeeze a drop of blood onto the test strip. Wait for the meter to display your blood glucose level.",
          "imgUrl": "assets/images/learning/how_02/s3.png",
        },
      ],
    ),
  ];
}
