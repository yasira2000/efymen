import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class QuickNote extends StatelessWidget {
  const QuickNote({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuickNote",
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const CommonAppBar(),
          backgroundColor: colorScheme.background,
          body: TabBar(
            labelColor: colorScheme.primary,
            labelStyle: TextStyle(color: colorScheme.primary),
            tabs: const [
              Tab(text: "Quick Note"),
              Tab(text: "Scheduled"),
            ],
          ),
        ),
      ),
    );
  }
}
