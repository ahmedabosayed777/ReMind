import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _remindersToday = 5;
  int _completedThisWeek = 12;

  int get remindersToday => _remindersToday;
  int get completedThisWeek => _completedThisWeek;

  void addReminder() {
    _remindersToday++;
    notifyListeners();
  }

  void completeReminder() {
    if (_remindersToday > 0) {
      _remindersToday--;
      _completedThisWeek++;
      notifyListeners();
    }
  }
}

// Global instance to be accessed by other files
final counterController = CounterController();