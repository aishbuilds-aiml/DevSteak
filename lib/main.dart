import 'package:flutter/material.dart';

void main() {
  runApp(const DevStreakApp());
}

class DevStreakApp extends StatelessWidget {
  const DevStreakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevStreak',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int streak = 7;
  int xp = 320;
  double progress = 0.7;

  void codedToday() {
  setState(() {
    streak++;
    xp += 10;

    if (progress < 1.0) {
      progress += 0.1;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("DevStreak 🔥"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Current Streak",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$streak Days 🔥",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "XP Points",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$xp XP ⭐",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Goal",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 15),

                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation(
                      Colors.greenAccent,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${(progress * 100).toInt()}% Completed",
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: codedToday,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "I CODED TODAY 🚀",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                "Consistency beats motivation 💡",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}