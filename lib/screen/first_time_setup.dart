import 'package:flutter/material.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/component/steps_bar.dart';
import 'package:health_matrix/component/text_tittle.dart';

class FirstTimeSetup extends StatefulWidget {
  const FirstTimeSetup({super.key});

  @override
  State<FirstTimeSetup> createState() => _FirstTimeSetupState();
}

class _FirstTimeSetupState extends State<FirstTimeSetup> {
  int _currentQuestionIndex = 0;

  // List of questions and answers
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Did You Suffer In Any of These NCDs?',
      'answers': ["High Blood Pressure", "Heart Issues", "None"],
    },
    {
      'question': 'How Often Do You Do Medical Checkups?',
      'answers': ["Annually", "Every 3-6 months", "Monthly", "Never"],
    },
  ];

  void _answerQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Navigate to AppLayout when the quiz is finished
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AppLayout()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/onboarding_last.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 1,
                  offset: Offset(1, -2),
                )
              ],
            ),
            child: Column(
              children: [
                const TextTittleLeft(
                  title: "Let's Set Up Your Medical Record",
                  desc: "You're nearly there!",
                ),
                // Update StepsBar with the current index
                Container(
                  width: MediaQuery.sizeOf(context).width, 
                  margin: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/10,vertical: 30),
                  child:StepsBar(index: (_currentQuestionIndex).toString(), len: _questions.length),
                  
                ),
                
                
                // Pass necessary data to QuizWidget
                QuizWidget(
                  questions: _questions,
                  currentQuestionIndex: _currentQuestionIndex,
                  answerQuestion: _answerQuestion,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizWidget extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int currentQuestionIndex;
  final VoidCallback answerQuestion;

  const QuizWidget({
    super.key,
    required this.questions,
    required this.currentQuestionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex]['question'] as String;
    var currentAnswers = questions[currentQuestionIndex]['answers'] as List<String>;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentQuestion,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          ...currentAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
              child: ElevatedButton(
                onPressed: answerQuestion,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(answer),
              ),
            );
          }),
          TextButton(
            onPressed: answerQuestion,
            child: const Text(
              "Skip For Now",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }
}
