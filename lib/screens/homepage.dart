import 'package:efymen/screens/quickNote.dart';
import 'package:efymen/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
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
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.amber[400],
    elevation: 0,
    title: Container(
      padding: EdgeInsets.all(10),
      //color: Colors.amber[400],
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset("/logo.png"),
          Text('EFYMEN'),
        ],
      ),
    ),
  );
}
