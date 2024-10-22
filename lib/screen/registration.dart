import 'package:flutter/material.dart';
import 'package:health_matrix/component/alt_login.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/screen/first_time_setup.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                const TextTittleLeft(
                  title: "Welcome Here",
                  desc: "Few Steps To Go",
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Column(
                    children: [
                      _buildRoundedTextFormField(
                        icon: Icons.account_box_rounded,
                        labelText: "Username",
                      ),
                      const SizedBox(height: 10),
                      _buildRoundedTextFormField(
                        icon: Icons.mail_rounded,
                        labelText: "Email",
                      ),
                      const SizedBox(height: 10),
                      _buildRoundedTextFormField(
                        icon: Icons.lock_rounded,
                        labelText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      _buildRoundedTextFormField(
                        icon: Icons.phone_android_rounded,
                        labelText: "Phone No.",
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: RoundButton(
                          title: "Submit",
                          onPressed: FirstTimeSetup(),
                          bgColor: Colors.amber,
                          frColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const AltLogin(padX: 30, padY: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable method for rounded TextFormFields
  Widget _buildRoundedTextFormField({
    required IconData icon,
    required String labelText,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        obscureText: obscureText, // For password fields
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
