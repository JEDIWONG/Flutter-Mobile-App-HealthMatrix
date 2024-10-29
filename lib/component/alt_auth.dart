import 'package:flutter/material.dart';
import 'package:health_matrix/component/layout.dart';

class AltRegis extends StatelessWidget {
  const AltRegis({super.key, required this.padX, required this.padY, required this.onPressed,});

  final double padX;
  final double padY;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padX, vertical: padY),
      child: Column(
        children: [
          // Divider with better color contrast
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Divider(height: 1, thickness: 2, color: Colors.grey),
          ),
          // Instructional text
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Or",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          // Google sign-in button
          AltLoginButton(
            title: "Sign Up with Google",
            imgUrl: "assets/icons/google.png",
            onPressed: () {
              onPressed;
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AltLogin extends StatelessWidget {
  const AltLogin({super.key, required this.padX, required this.padY,});

  final double padX;
  final double padY;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padX, vertical: padY),
      child: Column(
        children: [
          // Divider with better color contrast
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Divider(height: 1, thickness: 2, color: Colors.grey),
          ),
          // Instructional text
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Or",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          // Google sign-in button
          AltLoginButton(
            title: "Sign in with Google",
            imgUrl: "assets/icons/google.png",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppLayout()));
              
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Custom button widget for alternate login buttons
class AltLoginButton extends StatelessWidget {
  final String title;
  final String imgUrl;
  final VoidCallback onPressed;

  const AltLoginButton({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        
        backgroundColor: Colors.white, // Google button background color
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          side: const BorderSide(color: Colors.grey), // Border color
          
        ),
        elevation: 1, // Slight shadow for a raised effect
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imgUrl,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87, // Text color
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}