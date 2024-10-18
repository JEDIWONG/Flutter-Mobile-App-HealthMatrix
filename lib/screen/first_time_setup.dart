import 'package:flutter/material.dart';
import 'package:health_matrix/component/banner.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/component/text_tittle.dart';

class FirstTimeSetup extends StatelessWidget{

  const FirstTimeSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageBanner(imgUrl: "assets/images/test_image.jpg", title: "Getting Doned"),      
            const TextTittleLeft(title: "lets Setup Your Medical Record", desc: "Your Are nearly there "),
            Container(
              width: 500,
              height: 500,
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 1,
                    offset: Offset(1, -2)
                  )
                ]
              ),
              child: const QuizWidget(),

            )
          ],
          
        ),
      )
    );
  }
}

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State <QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  //_QuizWidgetState({required arr});

  final List<Map<String, Object>> _questions = [
    
    {
      'question': 'Did you understand the concept of non-communicable disease (NCDs) ?',
      'answers': ['Yes', 'Partially', 'Not at all',"Others"],
    },
    {
      'question': 'Did you suffer in any of these non-communicable disease (NCDs) ?',
      'answers': ['Diabetes', 'Hypertension', 'Heart diseases',"Others",'None of above'],
    },
    {
      'question': 'How often did you do medical checkup ?',
      'answers': ["Anually","3 - 6 months","monthly","Never"],
    },
  ];

  int _currentQuestionIndex = 0;

  void _answerQuestion() {
    setState(() {
      
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppLayout()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    var currentQuestion = _questions[_currentQuestionIndex]['question'] as String;
    var currentAnswers = _questions[_currentQuestionIndex]['answers'] as List<String>;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentQuestion,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          
          ...currentAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: _answerQuestion, 
                child: Text(answer),
              ),
            );
          }),
        ],
      ),
    );
  }
}