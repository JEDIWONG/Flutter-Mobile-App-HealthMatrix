import 'package:health_matrix/model/guide.dart';
import 'package:health_matrix/model/user_steps.dart';
import 'package:health_matrix/model/user_water.dart';
import 'package:health_matrix/model/chapter.dart';


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

  static List<Chapter> chapterData = [
    Chapter(
      index: '1',
      title: "Introduction To NCDs",
      imgUrl: "assets/images/learning/learn_01.png",
      content: [
        "Non-communicable diseases (NCDs) are not passed from person to person.",
        "Common NCDs include heart disease, cancer, diabetes, and chronic respiratory diseases.",
        "NCDs are responsible for 71% of all global deaths annually.",
        "Unhealthy lifestyles, such as poor diet, physical inactivity, and smoking, increase NCD risk.",
        "NCDs often develop over time and are mainly preventable through lifestyle changes.",
        "Low- and middle-income countries bear the highest burden of NCDs."
      ], 
    ),

    Chapter(
      index: '2',
      title: "Diabetes",
      imgUrl: "assets/images/learning/learn_02.png",
      content: [
        "Diabetes is a chronic condition that affects the way the body processes blood sugar.",
        "There are three main types of diabetes: Type 1, Type 2, and gestational diabetes.",
        "Type 2 diabetes is the most common form, often associated with obesity and lifestyle.",
        "Diabetes can lead to serious health issues like heart disease, kidney failure, and vision loss.",
        "Managing diabetes involves diet, exercise, medication, and regular monitoring of blood sugar levels.",
        "Around 1 in 10 adults worldwide suffer from diabetes, and rates are increasing."
      ],
    ),

    Chapter(
      index: '3',
      title: "Hypertension",
      imgUrl: "assets/images/learning/learn_03.png",
      content: [
        "Hypertension, or high blood pressure, is a condition where blood pressure in the arteries is elevated.",
        "Often called a 'silent killer,' it can lead to heart disease, stroke, and kidney damage.",
        "Risk factors for hypertension include obesity, high salt intake, and physical inactivity.",
        "Regular monitoring and lifestyle changes are essential for managing high blood pressure.",
        "Hypertension affects more than a billion people globally.",
        "Medication, reduced salt intake, and exercise can help control blood pressure levels."
      ],
    ),

    Chapter(
      index: '4',
      title: "Heart Disease",
      imgUrl: "assets/images/learning/learn_04.png",
      content: [
        "Heart disease is a broad term for various heart-related conditions, including coronary artery disease.",
        "It is the leading cause of death worldwide, responsible for millions of deaths each year.",
        "Risk factors include smoking, high cholesterol, diabetes, and sedentary lifestyle.",
        "Symptoms can include chest pain, shortness of breath, and fatigue, but some cases are asymptomatic.",
        "Preventing heart disease involves a healthy diet, regular exercise, and not smoking.",
        "Regular check-ups and managing risk factors are crucial for heart health."
      ],
    ),


  ];
}
