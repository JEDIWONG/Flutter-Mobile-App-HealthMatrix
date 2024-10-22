import 'package:flutter/material.dart';
import 'package:health_matrix/component/alt_login.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/component/layout.dart';
import 'package:health_matrix/component/text_tittle.dart';
import 'package:health_matrix/style/style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/onboarding_last.jpg"),
              alignment: Alignment.topCenter,
            )
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 200),
            padding: const EdgeInsets.only(top: 30),
            
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // For left alignment
              children: [
                const TextTittleLeft(
                  title: "Welcome Back",
                  desc: "Glad To See You Here",
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  child: Column(
                    children: [
                      
                      _buildRoundedTextFormField(
                        icon: Icons.mail_rounded,
                        labelText: "Email",
                      ),
                      
                      const SizedBox(height: 10),

                      // Password Field
                      _buildRoundedTextFormField(
                        icon: Icons.lock_rounded,
                        labelText: "Password",
                        obscureText: true,
                      ),
                      
                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                          child: Text(
                            "Forgot Password?",
                            style: CustomStyle.link,
                          ),
                        ),
                      ),
                      
                      // Sign In Button
                      const RoundButton(
                        title: "Sign In",
                        onPressed: AppLayout(),
                        bgColor: Colors.deepPurple,
                        frColor: Colors.white,
                      ),
                      
                      // Alternate Login (Google, etc.)
                      const AltLogin(padX: 0, padY: 0),
                    ],
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }

  Widget _buildRoundedTextFormField({
    required IconData icon,
    required String labelText,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        obscureText: obscureText, // Used for password fields
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
