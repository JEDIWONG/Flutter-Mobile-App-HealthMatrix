import 'package:flutter/material.dart';
import 'package:health_matrix/component/alt_auth.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/screen/first_time_setup.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart'; // Syncfusion import

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int _currentStepIndex = 0;

  // This stores the user's input
  String _username = '';
  String _phoneNo = '';
  String _email = '';
  String _password = '';
  String _gender = 'Male';
  int age = 18;

  // List of steps for the form
  final List<Map<String, Object>> _steps = [
    {
      'stepTitle': 'Username and Phone No.',
      'inputFields': 'Username and Phone No.',
    },
    {
      'stepTitle': 'Email and Password',
      'inputFields': 'Email and Password',
    },
    {
      'stepTitle': 'Gender & Age',
      'inputFields': 'Gender & Age',
    },
    {
      'stepTitle': 'Height & Weight',
      'inputFields': 'Height & Weight',
    },
    {
      'stepTitle': 'Complete Registration',
      'inputFields': 'Submit Form',
    },
  ];

  void _nextStep() {
    if (_currentStepIndex < _steps.length - 1) {
      setState(() {
        _currentStepIndex++;
      });
    } else {
      // Move to FirstTimeSetup after the last step
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstTimeSetup()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/onboarding_last.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 200),
            padding: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTittleLeft(
                  title: "Welcome Here",
                  desc: "Few Steps To Go",
                ),
                // Step indicator using Syncfusion Gauge
                SfLinearGauge(
                  minimum: 0,
                  maximum: _steps.length - 1,
                  showTicks: false,
                  showLabels: false,
                  ranges: [
                    LinearGaugeRange(
                      startValue: 0,
                      endValue: _currentStepIndex.toDouble(),
                      color: Colors.deepPurple,
                    ),
                  ],
                  markerPointers: [
                    LinearShapePointer(
                      value: _currentStepIndex.toDouble(),
                      shapeType: LinearShapePointerType.diamond,
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                  barPointers: [
                    LinearBarPointer(
                      value: _currentStepIndex.toDouble(),
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Column(
                    children: [
                      if (_currentStepIndex == 0) ...[
                        _buildRoundedTextFormField(
                          icon: Icons.mail_rounded,
                          labelText: "Email",
                          onSaved: (value) {
                            _email = value ?? '';
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildRoundedTextFormField(
                          icon: Icons.lock_rounded,
                          labelText: "Password",
                          obscureText: true,
                          onSaved: (value) {
                            _password = value ?? '';
                          },
                        ),
                      ],
                      if (_currentStepIndex == 1) ...[
                        _buildRoundedTextFormField(
                          icon: Icons.account_box_rounded,
                          labelText: "Username",
                          onSaved: (value) {
                            _username = value ?? '';
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildRoundedTextFormField(
                          icon: Icons.phone_android_rounded,
                          labelText: "Phone No.",
                          onSaved: (value) {
                            _phoneNo = value ?? '';
                          },
                        ),
                      ],
                      if (_currentStepIndex == 2) ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.deepPurple)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<String>(
                                  value: 'Male',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                                const Text("Male"),
                                Radio<String>(
                                  value: 'Female',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                                const Text("Female"),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text("Please Select Your Age", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepPurpleAccent)),
                            const SizedBox(height: 10),
                            NumberPicker(
                              axis: Axis.horizontal,
                              textStyle: const TextStyle(color: Colors.black),
                              selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              value: age,
                              minValue: 1,
                              maxValue: 120,
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                      if (_currentStepIndex == 3) ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30),
                            const Text("Please Select Your Weight (Kg)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepPurpleAccent)),
                            const SizedBox(height: 10),
                            NumberPicker(
                              axis: Axis.horizontal,
                              textStyle: const TextStyle(color: Colors.black),
                              selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              value: age,
                              minValue: 10,
                              maxValue: 120,
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                            const SizedBox(height: 30),
                            const Text("Please Select Your Height (cm)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepPurpleAccent)),
                            const SizedBox(height: 10),
                            NumberPicker(
                              axis: Axis.horizontal,
                              textStyle: const TextStyle(color: Colors.black),
                              selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              value: age,
                              minValue: 10,
                              maxValue: 200,
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 30),
                      _buildSubmitOrNextButton(),
                    ],
                  ),
                ),
                if (_currentStepIndex == 0)
                  InkWell(
                    onTap: _nextStep,
                    child: AltRegis(padX: 30, padY: 0, onPressed: _nextStep),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Button to move to the next step or submit
  Widget _buildSubmitOrNextButton() {
    return ElevatedButton(
      onPressed: _nextStep,
      style: ElevatedButton.styleFrom(
        backgroundColor: _currentStepIndex < _steps.length - 2 ? Colors.purple : Colors.green,
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
      child: Text(_currentStepIndex < _steps.length - 2 ? "Next" : "Submit"),
    );
  }

  // Reusable method for rounded TextFormFields with onSaved callback
  Widget _buildRoundedTextFormField({
    required IconData icon,
    required String labelText,
    required void Function(String?) onSaved,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      obscureText: obscureText,
      onSaved: onSaved,
    );
  }
}
