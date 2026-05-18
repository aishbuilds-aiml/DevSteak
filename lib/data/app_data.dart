import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {

    AppData() {

        loadData();
    }

    int streak = 42;

    int totalXp = 14820;

    int level = 24;

    int completedDays = 218;

    int todayXp = 170;

    int dailyGoal = 200;

    bool sessionRunning = false;

    int sessionSeconds = 1500;
    Timer? timer;

    double get dailyProgress =>
        todayXp / dailyGoal;

    String get formattedTime {

        final minutes =
        (sessionSeconds ~/ 60)
            .toString()
            .padLeft(2, '0');
    
        final seconds =
        (sessionSeconds % 60)
            .toString()
            .padLeft(2, '0');

        return "$minutes:$seconds";
    }

    void startSession() {

        if (sessionRunning) return;

        sessionRunning = true;

        notifyListeners();

        timer = Timer.periodic(

            const Duration(seconds: 1),

                (timer) {

            if (sessionSeconds > 0) {

                sessionSeconds--;

                notifyListeners();

                } else {

                    completeSession();

                    stopSession();
                }
            },
        );
    }

    void stopSession() {

        timer?.cancel();

        sessionRunning = false;

        sessionSeconds = 1500;

        notifyListeners();
    }

    void completeSession() {

        todayXp += 25;

        totalXp += 25;

        if (todayXp > dailyGoal) {
        todayXp = dailyGoal;
        }

        if (totalXp > level * 1000) {
        level++;
        }

        saveData();

        notifyListeners();
    }

    void completeDay() {

        if (todayXp >= dailyGoal) {
        streak++;
        completedDays++;
        }

        saveData();

        notifyListeners();
    }

    Future<void> saveData() async {

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setInt("streak", streak);

    await prefs.setInt("totalXp", totalXp);

    await prefs.setInt("level", level);

    await prefs.setInt(
        "completedDays",
        completedDays);

    await prefs.setInt("todayXp", todayXp);
    }

    Future<void> loadData() async {

    final prefs =
    await SharedPreferences.getInstance();

    streak =
        prefs.getInt("streak") ?? 42;

    totalXp =
        prefs.getInt("totalXp") ?? 14820;

    level =
        prefs.getInt("level") ?? 24;

    completedDays =
        prefs.getInt("completedDays") ?? 218;

    todayXp =
        prefs.getInt("todayXp") ?? 170;

    notifyListeners();
    }
}