import 'package:efymen/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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
          Icons.asset("../assets/icons/logo.png"),
          Text('EFYMEN'),
        ],
      ),
    ),
  );
}
