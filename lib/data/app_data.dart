import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {

  int streak = 42;

  int xp = 14820;

  int level = 24;

  int completedDays = 218;

  void codeToday() {

    xp += 10;

    streak += 1;

    completedDays += 1;

    if (xp > level * 1000) {
      level++;
    }

    notifyListeners();
  }
}