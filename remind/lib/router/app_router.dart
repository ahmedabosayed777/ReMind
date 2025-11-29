import 'package:flutter/material.dart';
import '../pages/Dashboard.dart'; // Imports the screens

class AppRouter {
  // Route Name Constants
  static const String home = '/';
  static const String search = '/search';
  static const String reminders = '/reminders';
  static const String stays = '/stays';
  static const String profile = '/profile';
  static const String add = '/add';
  static const String stats = '/stats';

  // Route Map
  static Map<String, WidgetBuilder> get routes => {
        search: (context) => const SearchPage(),
        reminders: (context) => const RemindersPage(),
        stays: (context) => const StaysPage(),
        profile: (context) => const ProfilePage(),
        add: (context) => const AddItemPage(),
        stats: (context) => const StatsPage(),
      };
}