import 'package:flutter/material.dart';

Widget appBar() {
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.amber[400],
    height: 200,
    width: double.infinity,
    child: Row(
      children: [
        Image.asset("../assets/icons/logo.png"),
      ],
    ),
  );
}
