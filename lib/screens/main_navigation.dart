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

      bottomNavigationBar: Padding(

        padding: const EdgeInsets.all(18),

        child: Container(

          height: 82,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(34),

            gradient: LinearGradient(

              colors: [

                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.03),
              ],
            ),

            border: Border.all(
              color: Colors.white10,
            ),

            boxShadow: [

              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 30,
                spreadRadius: 1,
              ),
            ],
          ),

          child: ClipRRect(

            borderRadius: BorderRadius.circular(34),
              
            child: Theme(

              data: Theme.of(context).copyWith(

                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),

              child: BottomNavigationBar(

                currentIndex: currentIndex,

                onTap: (index) {

                  setState(() {
                    currentIndex = index;
                  });
                },

                type: BottomNavigationBarType.fixed,

                backgroundColor: Colors.transparent,

                elevation: 0,

                enableFeedback: false,

                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),

                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),

                selectedItemColor:
                Colors.deepPurpleAccent,

                unselectedItemColor:
                Colors.white54,

                showSelectedLabels: true,
                showUnselectedLabels: true,

                items: const [

                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: "Stats",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events),
                    label: "Awards",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: "Inbox",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
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