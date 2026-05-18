import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final appData = Provider.of<AppData>(context);

    final now = DateTime.now();

    final formattedDate =
        DateFormat('EEEE, MMM d').format(now).toUpperCase();

    return Scaffold(

      backgroundColor: const Color(0xFF070B1A),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 10),

                // DATE
                Text(
                  formattedDate,

                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade500,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10),

                // HEADING
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Hey, Aish 👋",

                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),

                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        "AK",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // MAIN CARD
                Container(

                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF111B44),
                        Color(0xFF1A103A),
                      ],
                    ),
                  ),

                  child: Column(

                    children: [

                      Row(

                        children: [

                          // CIRCLE
                          Expanded(

                            child: Container(

                              height: 170,
                              width: 170,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.greenAccent,
                                  width: 10,
                                ),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "${((appData.xp / 15000) * 100).toInt()}%",
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    "DAILY GOAL",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // STREAK + XP
                          Expanded(

                            child: Column(

                              children: [

                                Container(

                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 12,
                                  ),

                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1C1736),
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: Row(

                                    mainAxisAlignment:
                                    MainAxisAlignment.center,

                                    children: [

                                      const Icon(
                                        Icons.local_fire_department,
                                        color: Colors.orange,
                                      ),

                                      const SizedBox(width: 8),

                                      Text(
                                        "${appData.streak} day streak",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,

                                  children: [

                                    const Text(
                                      "XP today",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),

                                    Text(
                                      "${appData.xp} / 250",
                                      style: TextStyle(
                                        color: Colors.greenAccent.shade400,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),

                                  child: LinearProgressIndicator(
                                    minHeight: 10,
                                    value: appData.xp / 15000,
                                    backgroundColor: Colors.white12,
                                    valueColor:
                                    const AlwaysStoppedAnimation(
                                      Colors.greenAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // COMPLETE BUTTON
                      Container(

                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),

                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.deepOrange,
                            ],
                          ),

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: const Center(

                          child: Text(
                            "✓ Day complete! You're on fire 🔥",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // QUICK ACTIONS
                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    buildActionButton(Icons.code, "Code"),
                    buildActionButton(Icons.menu_book, "Learn"),
                    buildActionButton(Icons.coffee, "Break"),
                    buildActionButton(Icons.flash_on, "Boost"),
                  ],
                ),

                const SizedBox(height: 30),

                // THIS WEEK CARD
                Container(

                  height: 230,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color(0xFF101633),
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
                              fontSize: 28,
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

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.deepPurple,

        onPressed: () {
          appData.codeToday();
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildActionButton(
      IconData icon,
      String label,
      ) {

    return Container(

      width: 75,
      height: 75,

      decoration: BoxDecoration(
        color: const Color(0xFF151B3B),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: Colors.deepPurpleAccent,
          ),

          const SizedBox(height: 8),

          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}