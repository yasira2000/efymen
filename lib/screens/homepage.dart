import 'package:efymen/screens/dailyRouting.dart';
import 'package:efymen/screens/goalPage.dart';
import 'package:efymen/screens/historyScreen.dart';
import 'package:efymen/screens/pomodoroTimer.dart';
import 'package:efymen/screens/progressScreen.dart';
import 'package:efymen/screens/todo.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: "EFYMEN",
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Todo(),
                ),
              );
            },
            child: const Text('text 1'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DailyRouting(),
                ),
              );
            },
            child: const Text('text 2'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoalPage(),
                ),
              );
            },
            child: const Text('text 3'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryPage(),
                ),
              );
            },
            child: const Text('text 4'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProgressPage(),
                ),
              );
            },
            child: const Text('text 5'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PomodoroTimerPage(),
                ),
              );
            },
            child: const Text('text 6'),
          ),
        ],
      ),
    );
  }
}
