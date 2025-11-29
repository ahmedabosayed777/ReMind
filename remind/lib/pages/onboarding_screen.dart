import 'package:flutter/material.dart';
import 'register_screen.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _fadeLogo;
  late Animation<Offset> _slideLogo;

  late AnimationController _cardsController;
  late List<Animation<double>> _fadeCards = [];
  late List<Animation<Offset>> _slideCards = [];

  late AnimationController _buttonController;
  late Animation<double> _fadeButton;

  @override
  void initState() {
    super.initState();

    // ====== Logo Animation ======
    _logoController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeLogo = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _logoController, curve: Curves.easeIn));
    _slideLogo = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    // ====== Cards Animation ======
    _cardsController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    for (int i = 0; i < 3; i++) {
      _fadeCards.add(Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: _cardsController, curve: Interval(i * 0.2, 1.0, curve: Curves.easeIn))));
      _slideCards.add(Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
          .animate(CurvedAnimation(parent: _cardsController, curve: Interval(i * 0.2, 1.0, curve: Curves.easeOut))));
    }

    // ====== Button Animation ======
    _buttonController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeButton = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeIn));

    // ====== Start Animations Sequentially ======
    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _logoController.forward();
    await _cardsController.forward();
    await _buttonController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _cardsController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

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


              FadeTransition(
                opacity: _fadeLogo,
                child: SlideTransition(
                  position: _slideLogo,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                ),
              ),

              // ===== Feature Cards =====
              Column(
                children: List.generate(3, (index) {
                  IconData icon;
                  String text;
                  if (index == 0) {
                    icon = Icons.location_on_rounded;
                    text = 'Location Smart Reminders';
                  } else if (index == 1) {
                    icon = Icons.wifi_rounded;
                    text = 'Device Connection Triggers';
                  } else {
                    icon = Icons.access_time_rounded;
                    text = 'Intelligent Time Scheduling';
                  }

                  return FadeTransition(
                    opacity: _fadeCards[index],
                    child: SlideTransition(
                      position: _slideCards[index],
                      child: FeatureCard(icon: icon, text: text),
                    ),
                  );
                }),
              ),

              // ===== Button =====
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FadeTransition(
                  opacity: _fadeButton,
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child :ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Feature Card Widget =====
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureCard({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.white),
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
