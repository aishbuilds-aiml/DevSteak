import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

import '../data/app_data.dart';

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
        DateFormat('EEEE, MMM d')
            .format(now)
            .toUpperCase();

    final progress =
    appData.dailyProgress.clamp(0.0, 1.0);

    return Scaffold(

      backgroundColor: const Color(0xFF070B1A),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

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

              const SizedBox(height: 14),

              // HEADER
              Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  Expanded(

                    child: Text(
                      "Hey, Aish 👋",

                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Container(

                    width: 68,
                    height: 68,

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,

                      gradient: const LinearGradient(

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Color(0xFF9B6DFF),
                          Color(0xFF6D28D9),
                        ],
                      ),

                      boxShadow: [

                        BoxShadow(
                          color:
                          Colors.deepPurple.withOpacity(0.45),

                          blurRadius: 25,
                          spreadRadius: 2,
                        ),
                      ],
                    ),

                    child: Center(

                      child: Text(
                        "AK",

                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // HERO CARD
              Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  borderRadius:
                  BorderRadius.circular(34),

                  gradient: const LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xFF121938),
                      Color(0xFF1B1245),
                    ],
                  ),

                  boxShadow: [

                    BoxShadow(
                      color:
                      Colors.deepPurple.withOpacity(0.18),

                      blurRadius: 40,
                      spreadRadius: 2,
                    ),
                  ],
                ),

                child: Column(

                  children: [

                    Row(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        // PROGRESS RING
                        SizedBox(

                          width: 118,
                          height: 118,

                          child: Stack(

                            alignment: Alignment.center,

                            children: [

                              SizedBox(

                                width: 118,
                                height: 118,

                                child:
                                CircularProgressIndicator(

                                  value: progress,

                                  strokeWidth: 10,

                                  backgroundColor:
                                  Colors.white12,

                                  valueColor:
                                  const AlwaysStoppedAnimation(
                                    Colors.greenAccent,
                                  ),
                                ),
                              ),

                              Column(

                                mainAxisAlignment:
                                MainAxisAlignment.center,

                                children: [

                                  Text(
                                    "${(progress * 100).toInt()}%",

                                    style:
                                    GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    "DAILY GOAL",

                                    style:
                                    GoogleFonts.poppins(
                                      color:
                                      Colors.grey.shade500,

                                      fontSize: 11,

                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        // RIGHT SECTION
                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              // STREAK PILL
                              Container(

                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(

                                  color: Colors.white10,

                                  borderRadius:
                                  BorderRadius.circular(22),
                                ),

                                child: Row(

                                  mainAxisSize:
                                  MainAxisSize.min,

                                  children: [

                                    const Icon(
                                      Icons.local_fire_department,
                                      color: Colors.orange,
                                      size: 20,
                                    ),

                                    const SizedBox(width: 6),

                                    Flexible(

                                      child: Text(
                                        "${appData.streak} day streak",

                                        overflow:
                                        TextOverflow.ellipsis,

                                        style:
                                        GoogleFonts.poppins(
                                          fontWeight:
                                          FontWeight.w600,

                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 18),

                              Container(

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),

                                decoration: BoxDecoration(

                                  color: Colors.white10,

                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),

                                child: Row(

                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,

                                  children: [

                                    Column(

                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                      children: [

                                        Text(
                                          "Focus Session",

                                          style: GoogleFonts.poppins(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          appData.formattedTime,

                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),

                                    GestureDetector(

                                      onTap: () {

                                        if (appData.sessionRunning) {

                                          appData.stopSession();

                                        } else {

                                          appData.startSession();
                                        }
                                      },

                                      child: Container(

                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 10,
                                        ),

                                        decoration: BoxDecoration(

                                          gradient: LinearGradient(

                                            colors:
                                            appData.sessionRunning
                                                ? [
                                              Colors.redAccent,
                                              Colors.deepOrange,
                                            ]
                                                : [
                                              Colors.greenAccent,
                                              Colors.green,
                                            ],
                                          ),

                                          borderRadius:
                                          BorderRadius.circular(18),
                                        ),

                                        child: Text(

                                          appData.sessionRunning
                                              ? "Stop"
                                              : "Start",

                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 18),

                              Text(
                                "XP today",

                                style:
                                GoogleFonts.poppins(
                                  color:
                                  Colors.grey.shade400,

                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "+${appData.todayXp} XP",

                                overflow:
                                TextOverflow.ellipsis,

                                style:
                                GoogleFonts.poppins(
                                  color:
                                  Colors.greenAccent,

                                  fontWeight:
                                  FontWeight.bold,

                                  fontSize: 22,
                                ),
                              ),

                              const SizedBox(height: 16),

                              ClipRRect(

                                borderRadius:
                                BorderRadius.circular(20),

                                child:
                                LinearProgressIndicator(

                                  value: progress,

                                  minHeight: 10,

                                  backgroundColor:
                                  Colors.white12,

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

                    const SizedBox(height: 22),

                    // COMPLETE BUTTON
                    Container(

                      width: double.infinity,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 18,
                      ),

                      decoration: BoxDecoration(

                        borderRadius:
                        BorderRadius.circular(26),

                        gradient: const LinearGradient(

                          colors: [
                            Color(0xFFFF8A1F),
                            Color(0xFFFF4D4D),
                          ],
                        ),
                      ),

                      child: Row(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),

                          const SizedBox(width: 10),

                          Text(
                            "Day complete! You're on fire 🔥",

                            style:
                            GoogleFonts.poppins(
                              fontWeight:
                              FontWeight.bold,

                              fontSize: 15,
                            ),
                          ),
                        ],
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
                    Icons.flash_on,
                    "Boost",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // THIS WEEK CARD
              Container(

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(

                  borderRadius:
                  BorderRadius.circular(32),

                  gradient: const LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xFF101632),
                      Color(0xFF171F45),
                    ],
                  ),

                  boxShadow: [

                    BoxShadow(
                      color:
                      Colors.deepPurple.withOpacity(0.12),

                      blurRadius: 30,
                    ),
                  ],
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          "This week",

                          style:
                          GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        Text(
                          "+24% vs last week",

                          style:
                          GoogleFonts.poppins(
                            color:
                            Colors.greenAccent,

                            fontWeight:
                            FontWeight.w600,

                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    SizedBox(

                      height: 120,

                      child: LineChart(

                        LineChartData(

                          gridData:
                          const FlGridData(show: false),

                          titlesData:
                          const FlTitlesData(show: false),

                          borderData:
                          FlBorderData(show: false),

                          lineBarsData: [

                            LineChartBarData(

                              spots: const [

                                FlSpot(0, 3),
                                FlSpot(1, 2),
                                FlSpot(2, 5),
                                FlSpot(3, 3.5),
                                FlSpot(4, 5),
                                FlSpot(5, 4),
                                FlSpot(6, 6),
                              ],

                              isCurved: true,

                              color: Colors.greenAccent,

                              barWidth: 4,

                              dotData:
                              const FlDotData(show: false),

                              belowBarData: BarAreaData(

                                show: true,

                                gradient: LinearGradient(

                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,

                                  colors: [

                                    Colors.greenAccent
                                        .withOpacity(0.35),

                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,

                      children: [

                        dayText("M"),
                        dayText("T"),
                        dayText("W"),
                        dayText("T"),
                        dayText("F"),
                        dayText("S"),
                        dayText("S"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(

        width: 78,
        height: 78,

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          gradient: const LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Color(0xFF8B5CF6),
              Color(0xFF6D28D9),
            ],
          ),

          boxShadow: [

            BoxShadow(
              color:
              Colors.deepPurple.withOpacity(0.5),

              blurRadius: 30,
              spreadRadius: 3,
            ),
          ],
        ),

        child: FloatingActionButton(

          backgroundColor: Colors.transparent,
          elevation: 0,

          onPressed: () {
            appData.completeSession();
          },

          child: const Icon(
            Icons.add,
            size: 34,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget dayText(String text) {

    return Text(

      text,

      style: GoogleFonts.poppins(
        color: Colors.white54,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buildActionButton(
      IconData icon,
      String label,
      ) {

    return Column(

      children: [

        Container(

          width: 74,
          height: 74,

          decoration: BoxDecoration(

            shape: BoxShape.circle,

            gradient: const LinearGradient(

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                Color(0xFF7B61FF),
                Color(0xFF5B3FD0),
              ],
            ),

            boxShadow: [

              BoxShadow(
                color:
                Colors.deepPurple.withOpacity(0.35),

                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),

          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          label,

          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}