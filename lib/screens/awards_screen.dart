import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/app_data.dart';

class AwardsScreen extends StatelessWidget {
  const AwardsScreen({super.key});

  Widget awardCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool unlocked,
    required Color color,
  }) {

    return Container(

      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: const Color(0xFF111633),

        borderRadius: BorderRadius.circular(28),

        border: Border.all(
          color:
          unlocked
              ? color.withOpacity(0.5)
              : Colors.white10,
        ),
      ),

      child: Row(

        children: [

          Container(

            width: 70,
            height: 70,

            decoration: BoxDecoration(
              color:
              unlocked
                  ? color.withOpacity(0.2)
                  : Colors.white10,

              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color:
              unlocked
                  ? color
                  : Colors.white38,

              size: 34,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                    color:
                    unlocked
                        ? Colors.white
                        : Colors.white54,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  subtitle,

                  style: TextStyle(
                    color:
                    unlocked
                        ? Colors.grey.shade400
                        : Colors.white38,

                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            unlocked
                ? Icons.lock_open
                : Icons.lock,

            color:
            unlocked
                ? Colors.greenAccent
                : Colors.white30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final appData = Provider.of<AppData>(context);

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                "UNLOCK YOUR POTENTIAL",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Awards",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              awardCard(
                title: "7 Day Warrior",
                subtitle:
                "Maintain a 7 day coding streak.",
                icon: Icons.local_fire_department,
                unlocked: appData.streak >= 7,
                color: Colors.orange,
              ),

              awardCard(
                title: "Consistency King",
                subtitle:
                "Reach a 30 day streak milestone.",
                icon: Icons.bolt,
                unlocked: appData.streak >= 30,
                color: Colors.deepPurpleAccent,
              ),

              awardCard(
                title: "XP Grinder",
                subtitle:
                "Earn over 10,000 XP points.",
                icon: Icons.flash_on,
                unlocked: appData.xp >= 10000,
                color: Colors.greenAccent,
              ),

              awardCard(
                title: "Legend League",
                subtitle:
                "Reach Level 50 to unlock this.",
                icon: Icons.emoji_events,
                unlocked: appData.level >= 50,
                color: Colors.amber,
              ),

              awardCard(
                title: "Code Beast",
                subtitle:
                "Complete 365 productive days.",
                icon: Icons.workspace_premium,
                unlocked:
                appData.completedDays >= 365,
                color: Colors.cyanAccent,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}