import 'package:efymen/screens/quickNote.dart';
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
                    builder: (context) => const QuickNote(),
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
