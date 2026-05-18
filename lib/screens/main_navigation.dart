import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'stats_screen.dart';
import 'awards_screen.dart';
import 'inbox_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState
    extends State<MainNavigation> {

  int currentIndex = 0;

  final List<Widget> screens = [

    const HomeScreen(),
    const StatsScreen(),
    const AwardsScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),

        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: const Color(0xFF111936),

          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            navItem(
              Icons.home,
              0,
            ),

            navItem(
              Icons.bar_chart,
              1,
            ),

            navItem(
              Icons.emoji_events,
              2,
            ),

            navItem(
              Icons.notifications,
              3,
            ),

            navItem(
              Icons.person,
              4,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(
      IconData icon,
      int index,
      ) {

    bool isActive =
        currentIndex == index;

    return GestureDetector(

      onTap: () {

        setState(() {
          currentIndex = index;
        });
      },

      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color:
          isActive
              ? Colors.deepPurple
              : Colors.transparent,

          borderRadius:
          BorderRadius.circular(20),
        ),

        child: Icon(
          icon,

          color:
          isActive
              ? Colors.white
              : Colors.white54,
        ),
      ),
    );
  }
}