import 'dart:ui';
import 'package:efymen/models/timeTable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DailyRouting extends StatefulWidget {
  const DailyRouting({super.key});

  @override
  State<DailyRouting> createState() => _DailyRoutingState();
}

class _DailyRoutingState extends State<DailyRouting>
    with TickerProviderStateMixin {
  final List<String> week = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
  final List<String> weekdata = [
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
    "SUN"
  ];
  List<TimeTable> timetable = [
    TimeTable("doing numerical practice questions and train the speech",
        DateTime(2023, 7, 13, 01, 30), DateTime(2023, 7, 13, 02, 30), 'home'),
    TimeTable(
        "doing numerical practice questions doing numerical practice questions numerical practice questions",
        DateTime(2023, 7, 13, 11, 30),
        DateTime(2023, 7, 13, 13, 30),
        'university'),
    TimeTable("doing numerical practice questions",
        DateTime(2023, 7, 13, 18, 30), DateTime(2023, 7, 13, 18, 50), 'bodima'),
    TimeTable(
        "doing numerical practice questions doing numerical questions doing aaaa numerical practice questions",
        DateTime(2023, 7, 13, 7, 30),
        DateTime(2023, 7, 13, 09, 30),
        'home'),
  ];
  int current = 1;
  @override
  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    ColorScheme colorscheme = Theme.of(context).colorScheme;
    double containerWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: colorscheme.primary,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        DateFormat.EEEE().format(datetime).toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Wrap(
                      children: [
                        Text(
                          DateFormat.d().format(datetime),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          int.parse(DateFormat.d().format(datetime)) == 1
                              ? 'st'
                              : int.parse(DateFormat.d().format(datetime)) == 2
                                  ? 'nd'
                                  : int.parse(DateFormat.d()
                                              .format(datetime)) ==
                                          21
                                      ? 'st'
                                      : int.parse(DateFormat.d()
                                                  .format(datetime)) ==
                                              22
                                          ? 'nd'
                                          : int.parse(DateFormat.d()
                                                      .format(datetime)) ==
                                                  31
                                              ? 'st'
                                              : 'th',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFeatures: [FontFeature.superscripts()]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateFormat.MMMM().format(datetime),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFF0C0)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: week.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.2),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: containerWidth / 9.7,
                            height: 80,
                            decoration: BoxDecoration(
                                color: current == index
                                    ? Color(0xFFFFEAA3)
                                    : Colors.white,
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
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                week[index],
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width / 6,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF9E6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.height - 260,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 6) * 5,
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: timetable.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          bottom: 10,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFEBAA),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const VerticalDivider(
                                        width: 10,
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      TimeWidget(
                                        time: timetable[index].startingTime,
                                      ),
                                      const Text(' - '),
                                      TimeWidget(
                                          time: timetable[index].endingTime),
                                    ],
                                  ),
                                  Text(timetable[index].description)
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 20,
                              child: Container(
                                height: 20,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  final DateTime time;
  const TimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    if (time.hour > 12) {
      if (time.minute < 10) {
        return Text("${time.hour - 12}.0${time.minute} P.M");
      } else {
        return Text("${time.hour - 12}.${time.minute} P.M");
      }
    } else {
      if (time.minute < 10) {
        return Text("${time.hour}.0${time.minute} A.M");
      } else {
        return Text("${time.hour}.${time.minute} A.M");
      }
    }
  }
}
