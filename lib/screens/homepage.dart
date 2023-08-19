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
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Todo(),
                  ),
                );
              },
              child: const Text('text'),
            ),
          ),
        ],
      ),
    );
  }
}
