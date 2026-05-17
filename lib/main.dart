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

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070B1A),
      ),

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

  int streak = 43;
  int xp = 250;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 20),

                const Text(
                  "Hey, Aish 👋",
                  
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                // TOP CARD

                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors: [
                        Color(0xFF1B2344),
                        Color(0xFF0D1224),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 25,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                "$streak day streak",

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                "XP today",

                                style: TextStyle(
                                  color:
                                  Colors.white.withOpacity(0.7),
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                "+$xp XP",

                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            width: 120,
                            height: 120,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: Colors.greenAccent,
                                width: 10,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Colors.greenAccent.withOpacity(0.5),
                                  blurRadius: 20,
                                ),
                              ],
                            ),

                            child: const Center(
                              child: Text(
                                "100%",

                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          gradient: const LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.deepOrange,
                            ],
                          ),
                        ),

                        child: const Center(
                          child: Text(
                            "Day Complete! You're on fire 🔥",

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ACTION BUTTONS

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    buildActionButton(
                      Icons.code,
                      "Code",
                    ),

                    buildActionButton(
                      Icons.menu_book,
                      "Learn",
                    ),

                    buildActionButton(
                      Icons.coffee,
                      "Break",
                    ),

                    buildActionButton(
                      Icons.bolt,
                      "Boost",
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // WEEK SECTION

                Container(
                  height: 220,
                  width: double.infinity,

                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: const Color(0xFF111936),

                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            "This week",

                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "+24% vs last week",

                            style: TextStyle(
                              color: Colors.greenAccent.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,

                        children: const [

                          Text("M"),
                          Text("T"),
                          Text("W"),
                          Text("T"),
                          Text("F"),
                          Text("S"),
                          Text("S"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),

      // FLOATING BUTTON

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,

        onPressed: () {

          setState(() {
            xp += 10;
            streak += 1;
          });
        },

        child: const Icon(Icons.add),
      ),

      // BOTTOM NAVIGATION

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),

        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: const Color(0xFF111936),

          borderRadius: BorderRadius.circular(30),
        ),

        child: const Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            BottomNavItem(
              icon: Icons.home,
              label: "Home",
              active: true,
            ),

            BottomNavItem(
              icon: Icons.bar_chart,
              label: "Stats",
            ),

            BottomNavItem(
              icon: Icons.emoji_events,
              label: "Awards",
            ),

            BottomNavItem(
              icon: Icons.notifications,
              label: "Inbox",
            ),

            BottomNavItem(
              icon: Icons.person,
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildActionButton(
    IconData icon,
    String title,
    ) {

  return Container(
    width: 75,
    height: 90,

    decoration: BoxDecoration(
      color: const Color(0xFF111936),

      borderRadius: BorderRadius.circular(24),

      border: Border.all(
        color: Colors.white.withOpacity(0.05),
      ),
    ),

    child: Column(
      mainAxisAlignment:
      MainAxisAlignment.center,

      children: [

        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.deepPurple,

          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class BottomNavItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final bool active;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [

        Icon(
          icon,
          color:
          active
              ? Colors.deepPurpleAccent
              : Colors.white54,
        ),

        const SizedBox(height: 5),

        Text(
          label,

          style: TextStyle(
            color:
            active
                ? Colors.white
                : Colors.white54,

            fontSize: 12,
          ),
        ),
      ],
    );
  }
}