import 'package:efymen/models/Pomodoru.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  int current = 0;
  List<String> text = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  List<List<Pomodoru>> week = [
    [
      Pomodoru('none', DateTime(2017, 9, 7, 3, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 4, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 5, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 5, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 9, 30), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 2, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 14, 40), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 55), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 18, 20), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 1, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 4, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 5, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 17, 30), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 3, 10), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 5, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 7, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 8, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 9, 30), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 3, 20), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 4, 12), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 6, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 19, 10), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 13, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 14, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 15, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 19, 30), 'goal')
    ],
    [
      Pomodoru('none', DateTime(2017, 9, 7, 4, 40), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 7, 23), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 93, 47), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 14, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 17, 0), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 20, 30), 'goal'),
      Pomodoru('none', DateTime(2017, 9, 7, 21, 0), 'goal')
    ],
  ];
  @override
  Widget build(BuildContext context) {
    Size container = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: 'History',
      ),
      body: Stack(
        children: [
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
            left: container.width / 10,
            top: container.height / 2,
            child: Container(
              height: 75,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFC300),
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Text("Task Completed"),
                  Text(
                    '2',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "less than last week",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: container.width / 10,
            top: container.height / 2 + 100,
            child: Container(
              height: 75,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFC300),
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Text("Focus time"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'h',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '43',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'min',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "more than last weel",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: container.width / 10,
            top: container.height / 7,
            child: Column(
              children: [
                for (int i = 0; i < days.length; i++)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 42),
                        child: Container(
                          height: 1,
                          width: container.width / 1.5 + 2,
                          color: Colors.black,
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            SizedBox(
                                width: 40,
                                height: 25,
                                child: Center(child: Text(days[i]))),
                            const VerticalDivider(
                              thickness: 2,
                              width: 0,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: container.width / 1.5,
                              child: Stack(
                                children: [
                                  for (int x = 0; x < week[i].length; x++)
                                    Positioned(
                                      left: (container.width / 36) *
                                          (week[i][x].start.hour +
                                              week[i][x].start.minute / 60),
                                      child: Container(
                                        height: 25,
                                        width: container.width * 5 / 432,
                                        color: Colors.amber,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              width: 0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 42),
                        child: Container(
                          height: 1,
                          width: container.width / 1.5 + 2,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Positioned(
            left: container.width / 5.15,
            top: container.height / 7 + 215,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 6,
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: container.width / 1.5 / 4 - 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE5A0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: container.width / 1.5 / 4 - 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE5A0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: container.width / 1.5 / 4 - 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE5A0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 5,
                      width: container.width / 1.5 / 4 - 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE5A0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      '00.00',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: container.width / 1.5 / 4 - 20,
                    ),
                    const Text(
                      '06.00',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: container.width / 1.5 / 4 - 20,
                    ),
                    const Text(
                      '12.00',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: container.width / 1.5 / 4 - 20,
                    ),
                    const Text(
                      '18.00',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: container.width / 1.5 / 4 - 20,
                    ),
                    const Text(
                      '24.00',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
