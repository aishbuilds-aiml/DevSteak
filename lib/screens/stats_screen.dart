import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../data/app_data.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  Widget statCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFF111633),
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget insightTile({
    required String title,
    required String subtitle,
    required Color dotColor,
  }) {

    return Container(

      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xFF111633),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(
            width: 10,
            height: 10,

            margin: const EdgeInsets.only(top: 7),

            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
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

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "YOUR JOURNEY",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.9,

                children: [

                  statCard(
                    icon: Icons.access_time,
                    title: "CODING HOURS",
                    value: "${appData.totalXp ~/ 50}h",
                    subtitle: "this year",
                    color: Colors.deepPurple,
                  ),

                  statCard(
                    icon: Icons.local_fire_department,
                    title: "LONGEST STREAK",
                    value: "${appData.streak}d",
                    subtitle: "personal best",
                    color: Colors.orange,
                  ),

                  statCard(
                    icon: Icons.flash_on,
                    title: "TOTAL XP",
                    value: "${appData.totalXp}",
                    subtitle: "Level ${appData.level}",
                    color: Colors.green,
                  ),

                  statCard(
                    icon: Icons.trending_up,
                    title: "AVG / DAY",
                    value: "1h ",
                    subtitle: "+12% mo",
                    color: Colors.purple,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // MONTHLY ACTIVITY

              Container(

                height: 260,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: const Color(0xFF111633),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          "Monthly activity",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Last 12 months",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Expanded(

                      child: LineChart(

                        LineChartData(

                          gridData: const FlGridData(show: false),

                          titlesData: const FlTitlesData(show: false),

                          borderData: FlBorderData(show: false),

                          lineBarsData: [

                            LineChartBarData(

                              isCurved: true,

                              color: Colors.deepPurpleAccent,

                              barWidth: 4,

                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.deepPurpleAccent.withOpacity(0.2),
                              ),

                              dotData: FlDotData(
                                show: true,

                                getDotPainter:
                                    (spot, percent, bar, index) {

                                  return FlDotCirclePainter(
                                    radius: 4,
                                    color: Colors.greenAccent,
                                    strokeWidth: 0,
                                  );
                                },
                              ),

                              spots: const [

                                FlSpot(0, 3),
                                FlSpot(1, 2),
                                FlSpot(2, 5),
                                FlSpot(3, 4),
                                FlSpot(4, 3),
                                FlSpot(5, 4),
                                FlSpot(6, 4),
                                FlSpot(7, 3.5),
                                FlSpot(8, 1),
                                FlSpot(9, 1.8),
                                FlSpot(10, 1.5),
                                FlSpot(11, 2.2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // HEATMAP CARD

              Container(

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: const Color(0xFF111633),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Contribution heatmap",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "${appData.completedDays} commits",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Wrap(
                      spacing: 6,
                      runSpacing: 6,

                      children: List.generate(84, (index) {

                        List<Color> colors = [

                          const Color(0xFF1C2142),
                          Colors.green.shade900,
                          Colors.green.shade700,
                          Colors.lime.shade700,
                          Colors.lime.shade300,
                        ];

                        return Container(
                          width: 18,
                          height: 18,

                          decoration: BoxDecoration(
                            color: colors[index % colors.length],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [

                        const Text(
                          "Less",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(width: 10),

                        ...List.generate(5, (index) {

                          List<Color> colors = [

                            const Color(0xFF1C2142),
                            Colors.green.shade900,
                            Colors.green.shade700,
                            Colors.lime.shade700,
                            Colors.lime.shade300,
                          ];

                          return Container(

                            margin: const EdgeInsets.symmetric(horizontal: 3),

                            width: 12,
                            height: 12,

                            decoration: BoxDecoration(
                              color: colors[index],
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),

                        const SizedBox(width: 10),

                        const Text(
                          "More",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Productivity insights",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              insightTile(
                title: "Peak hours",
                subtitle:
                "You ship most code between 9–11 PM. Schedule deep work then.",
                dotColor: Colors.greenAccent,
              ),

              insightTile(
                title: "Weekend slump",
                subtitle:
                "Saturdays drop 40%. A 10-min ritual could keep your streak alive.",
                dotColor: Colors.deepPurpleAccent,
              ),

              insightTile(
                title: "On a roll",
                subtitle:
                "You hit your daily goal 6 out of last 7 days. Keep going!",
                dotColor: Colors.greenAccent,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}