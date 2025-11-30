import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/reminder_item.dart';
import 'pages/reminder_page.dart';

void main() {
  runApp(const ThemeSwitcher());
}

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(isDarkMode: isDarkMode, toggleTheme: toggleTheme);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDarkMode, required this.toggleTheme});

  final bool isDarkMode;
  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xfff3f4f7),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121212),
        useMaterial3: true,
      ),
      home: ReminderPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
    );
  }
}
