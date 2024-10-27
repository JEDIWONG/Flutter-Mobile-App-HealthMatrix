import 'package:flutter/material.dart';
import 'package:health_matrix/component/custom_button.dart';
import 'package:health_matrix/screen/auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State <Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView for swiping between screens
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              buildScreen(
                
                title: 'Discover the world of healthy lifestyle',
                description: '',
                imgUrl: 'assets/images/onboarding_01.png',
              ),
              buildScreen(
                
                title: 'Monitoring Your Health',
                description: 'Keep track of everything with ease',
                imgUrl: 'assets/images/onboarding_02.png',
              ),
              lastScreen()
            ],
          ),
          // Page Indicator at the bottom
          Positioned(
            bottom: 30,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.blueAccent,
                dotColor: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build each onboarding page
  Widget buildScreen({required String title, required String description, required String imgUrl}) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: BoxFit.cover
        ),
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ // You need to provide the image assets
            const SizedBox(height: 40),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black,
                    offset: Offset(1, 1)
                  )
                ]
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 205, 97),
                shadows: [
                  Shadow(
                    blurRadius: 0.5,
                    color: Colors.black,
                    offset: Offset(1, 1)
                  )
                ]
              
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastScreen() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding_last.jpg"),
            fit: BoxFit.cover
        ),
      ),
      
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ 

            Image.asset("assets/images/logo_01.png"),
            const Text(
              "Health First,",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Everything Else Follows",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 205, 97),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: RoundButton(title: "Get Started", onPressed: Auth(), bgColor: Colors.deepPurpleAccent, frColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}