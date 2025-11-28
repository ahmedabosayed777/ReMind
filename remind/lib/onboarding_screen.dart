import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A90E2),
              Color(0xFF8E2DE2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.psychology_alt_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'ReMind',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),


              Column(
                children: const [
                  FeatureCard(
                    icon: Icons.location_on_rounded,
                    text: 'Location Smart Reminders',
                  ),
                  SizedBox(height: 16),
                  FeatureCard(
                    icon: Icons.wifi_rounded,
                    text: 'Device Connection Triggers',
                  ),
                  SizedBox(height: 16),
                  FeatureCard(
                    icon: Icons.access_time_rounded,
                    text: 'Intelligent Time Scheduling',
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color(0xFF5A4FFF),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
