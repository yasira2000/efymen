import 'package:efymen/widgets/barGraph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});
  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List<double> weeklySummary = [
    13.2,
    8.45,
    2.34,
    10.5,
    16.12,
    5.6,
    4.33,
  ];
  int current = 0;
  List<String> text = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  @override
  Widget build(BuildContext context) {
    Size container = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: 'Progress',
      ),
      body: Stack(
        children: [
          Positioned(
            left: container.width / 10,
            top: 20,
            child: Column(
              children: [
                Row(
                  children: [
                    for (int index = 0; index < text.length; index++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: container.width / 5,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: index == 0
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))
                                : index == text.length - 1
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25))
                                    : const BorderRadius.all(
                                        Radius.circular(0)),
                            color: current == index
                                ? Color(0xFFFAE5A0)
                                : Color(0xFFFFF7DD),
                            boxShadow: current == index
                                ? const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.5,
                                        offset: Offset(0, 1))
                                  ]
                                : const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.5,
                                        offset: Offset(0, 1))
                                  ],
                          ),
                          child: Center(
                            child: Text(
                              text[index],
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: -container.width / 3.3,
            top: container.height / 12,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage("assets/icons/image1.png"),
                ),
              ),
            ),
          ),
          Positioned(
            right: -container.width / 3.3,
            bottom: container.height / 12,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage("assets/icons/image2.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: container.height / 7,
            left: container.width / 40,
            child: SizedBox(
              height: container.height / 2.5,
              width: container.width / 1.1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: WeekBarGraph(weeklySummary: weeklySummary),
              ),
            ),
          ),
          Positioned(
              left: container.width / 10,
              top: container.height / 1.8,
              child: const Text(
                'Focus time periods for different types of tasks',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              )),
          Positioned(
            left: container.width / 10,
            top: container.height / 1.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: container.width / 20,
                      width: container.width / 20,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(container.width / 40),
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '12.3h ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      ' /20h ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          fontSize: 12),
                    ),
                    const Text(
                      ' - Academic',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black26),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: container.width / 20,
                      width: container.width / 20,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(container.width / 40),
                          color: Colors.red),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '12.3h ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      ' /20h ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          fontSize: 12),
                    ),
                    const Text(
                      ' - Goal',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black26),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: container.width / 20,
                      width: container.width / 20,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(container.width / 40),
                          color: Colors.amber),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '12.3h ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      ' /20h ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          fontSize: 12),
                    ),
                    const Text(
                      ' - Other',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black26),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
