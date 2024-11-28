import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "image": "assets/images/onboarding_1.png",
      "title": "Welcome to Map Memos",
      "description":
          "Allow Map Memos to access this device's location all the time?",
      "backgroundColor": Color(0xFFFFFFFF),
      "layoutType": "old", // Old layout
    },
    {
      "image": "assets/images/onboarding_2.png",
      "title": "Map Memos would like to send you notifications",
      "description":
          "Notifications may include alerts, reminders, and sounds. You can configure this in Settings.",
      "backgroundColor": Color(0xFFE8F4F8),
      "layoutType": "new", // New layout
    },
    {
      "image": "assets/images/onboarding_3.png",
      "title": "Let Map Memos always run in the background?",
      "description":
          "Allowing Map Memos to always run in the background may reduce battery life. You can change this later from Settings.",
      "backgroundColor": Color(0xFFF7E0E0),
      "layoutType": "old", // Old layout
    },
    {
      "image": "assets/images/onboarding_4.png",
      "title": "Map Memos would like to access your Calendar",
      "description": "Calendars are used to show tasks and events.",
      "backgroundColor": Color(0xFFF9F3D7),
      "layoutType": "new", // New layout
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: _onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return _buildPage(
              image: _onboardingData[index]["image"]!,
              title: _onboardingData[index]["title"]!,
              description: _onboardingData[index]["description"]!,
              backgroundColor: _onboardingData[index]["backgroundColor"]!,
              layoutType: _onboardingData[index]["layoutType"]!);
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
    required Color backgroundColor,
    required String layoutType, // New parameter to decide layout type
  }) {
    if (layoutType == "old") {
      // Old Layout: Image on top, Title and Description below
      return Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image on top
            Image.asset(
              image,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 32),
            // Title and Description below the Image
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins', // Use Poppins font
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins', // Use Poppins font
                  color: Color(0xFF7D7D7D),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      // New Layout: Title and Description on top, Image below
      return Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title and Description on top
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Color(0xFF7D7D7D),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              image,
              width: 200,
              height: 200,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_currentPage < _onboardingData.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                // Navigate to the next screen (e.g., home screen)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Placeholder(), // Replace with your next screen
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Set button color to white
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 50), // Full-width button
            ),
            child: Text(
              _currentPage < _onboardingData.length - 1
                  ? "Next"
                  : "Get Started",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins', // Set to Poppins font
                color: Colors.white, // Button text color to black
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
