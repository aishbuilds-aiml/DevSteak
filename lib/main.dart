import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/app_data.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(

    ChangeNotifierProvider(

      create: (_) => AppData(),

      child: const DevStreakApp(),
    ),
  );
}

class DevStreakApp extends StatelessWidget {
  const DevStreakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevStreak',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070B1A),
      ),

      home: const MainNavigation(),
    );
  }
}

