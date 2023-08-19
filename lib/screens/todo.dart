import 'package:efymen/models/QNote.dart';
import 'package:efymen/models/Schedule.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:string_to_color/string_to_color.dart';
import 'package:intl/intl.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> with TickerProviderStateMixin {
  late TabController _tabController;
  bool divide = true;
  List<QNote> notes = [
    QNote("have to get a red pen ", '0xffff0000'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download",
        '0xff0000ff'),
    QNote("download Spiderman movie Mission imposible 5 movie download ",
        '0xff0000ff'),
    QNote("Mission imposible 5 movie download", '0xffff0000'),
    QNote("Mission imposible 5 movie download", '0xff00ff00'),
    QNote("Mission imposible 5 movie download", '0xffff0000'),
    QNote("Mission imposible 5 movie download", '0xff0000ff'),
  ];
  List<QNote> done = [
    QNote("have to get a red pen ", '0xff0000ff'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download",
        '0xff0000ff'),
    QNote("download Spiderman movie Mission imposible 5 movie download ",
        '0xff0000ff'),
    QNote("Mission imposible 5 movie download", '0xff00ff00'),
    QNote("Mission imposible 5 movie download", '0xff00ff00'),
    QNote("Mission imposible 5 movie download", '0xffff0000'),
    QNote("Mission imposible 5 movie download", '0xff0000ff'),
  ];

  List<Scheduled> schedule = [
    Scheduled(
      "submit project praposal.submit project reportsubmit project reportsubmit project reportsubmit project reportsubmit project report",
      DateTime(2023, 7, 13, 01, 01),
    ),
    Scheduled(
      "submit project report",
      DateTime(2023, 8, 20, 13, 15),
    ),
    Scheduled(
      "submit project sds",
      DateTime(2023, 9, 22, 17, 25),
    ),
    Scheduled(
      "submit project srs",
      DateTime(2023, 10, 25, 23, 59),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: const CommonAppBar(
        textTitle: "Todo",
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              labelColor: colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndecator(color: Colors.grey.shade400, radius: 4),
              unselectedLabelColor: colorScheme.onBackground,
              isScrollable: true,
              tabs: const [
                Tab(text: "Quick Note"),
                Tab(text: "Scheduled"),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            indent: 30,
            endIndent: 30,
            color: Color(0xFFDDDDDD),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: notes.length + done.length + 1,
                  itemBuilder: (context, index) {
                    if (index == notes.length) {
                      if (done.isNotEmpty) {
                        return Column(
                          children: [
                            const Divider(
                              indent: 30,
                              endIndent: 30,
                              color: Color(0xFFDDDDDD),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Finished",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFC8C8C8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 260),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: const Color(0xFFFADADA),
                                      ),
                                      height: 20,
                                      width: 50,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Clear',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10),
                                          ),
                                          Icon(
                                            Icons.delete,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        );
                      }
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: index < notes.length ? () {} : () {},
                          icon: index < notes.length
                              ? const Icon(Icons.circle_outlined)
                              : const Icon(Icons.check_circle),
                          color: index < notes.length
                              ? ColorUtils.stringToColor(notes[index].priority)
                              : Colors.green,
                          iconSize: 25,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 40, top: 15),
                            child: Text(
                              index < notes.length
                                  ? notes[index].description
                                  : done[index - notes.length - 1].description,
                              overflow: TextOverflow.clip,
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ListView.builder(
                  itemCount: schedule.length,
                  itemBuilder: (context, index) {
                    if (schedule[index].date.isAfter(DateTime.now()) & divide) {
                      divide = false;
                      return Column(
                        children: [
                          const Divider(
                            indent: 30,
                            endIndent: 30,
                            color: Color(0xFFDDDDDD),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 30, top: 10, bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: schedule[index]
                                                    .date
                                                    .isBefore(DateTime.now())
                                                ? const Color(0xFFFFF2C8)
                                                : Colors.white,
                                            border: Border.all(
                                              color: colorScheme.primary,
                                              width: 3,
                                            )),
                                        child: Center(
                                            child: Text(
                                                schedule[index]
                                                    .date
                                                    .day
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme.primary,
                                                ))),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        DateFormat.MMM()
                                            .format(schedule[index].date),
                                        style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFFFFE17F),
                                      ),
                                      width: 214,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              schedule[index].date.hour >= 12
                                                  ? "${schedule[index].date.hour}.${schedule[index].date.minute} P.M"
                                                  : "${schedule[index].date.hour}.${schedule[index].date.minute} A.M",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              schedule[index].description,
                                              overflow: TextOverflow.visible,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 30, top: 10, bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: schedule[index]
                                              .date
                                              .isBefore(DateTime.now())
                                          ? const Color(0xFFFFF2C8)
                                          : Colors.white,
                                      border: Border.all(
                                        color: colorScheme.primary,
                                        width: 3,
                                      )),
                                  child: Center(
                                      child: Text(
                                          schedule[index].date.day.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.primary,
                                          ))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  DateFormat.MMM().format(schedule[index].date),
                                  style: TextStyle(
                                      color: colorScheme.primary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFFFE17F),
                                ),
                                width: 214,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        schedule[index].date.hour >= 12
                                            ? "${schedule[index].date.hour}.${schedule[index].date.minute} P.M"
                                            : "${schedule[index].date.hour}.${schedule[index].date.minute} A.M",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        schedule[index].description,
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndecator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndecator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
