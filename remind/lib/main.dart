import 'package:flutter/material.dart';
import 'package:remind/pages/Dashboard.dart';
import 'package:remind/pages/login.dart';
import 'package:remind/pages/onboarding_screen.dart';
import 'package:remind/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReMind',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/search': (context) => const SearchPage(),
        '/reminder': (context) => const RemindersPage(),
        '/style': (context) => const StaysPage(),
        '/profile': (context) => const ProfilePage(),
        '/addItem': (context) => const AddItemPage(),
        '/stats': (context) => const StatsPage(),
      },
    );
  }
}