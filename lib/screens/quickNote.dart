import 'package:efymen/models/QNote.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class QuickNote extends StatefulWidget {
  const QuickNote({super.key});

  @override
  State<QuickNote> createState() => _QuickNoteState();
}

class _QuickNoteState extends State<QuickNote> with TickerProviderStateMixin {
  late TabController _tabController;
  List<QNote> notes = [
    QNote("have to get a red pen ", 'red'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download",
        'blue'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download ", 'blue'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
  ];
  List<QNote> done = [
    QNote("have to get a red pen ", 'red'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download",
        'blue'),
    QNote(
        "download Spiderman movie Mission imposible 5 movie download ", 'blue'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
    QNote("Mission imposible 5 movie download", 'green'),
  ];
  // List<QNote> sheduled = [
  //   QNote("have to get a red pen", 'red'),
  //   QNote("download Spiderman movie", 'blue'),
  // ];
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
                            const Divider(),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
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
                      return const Divider();
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: index < notes.length ? () {} : () {},
                          icon: index < notes.length
                              ? const Icon(Icons.circle_outlined)
                              : const Icon(Icons.check_circle),
                          color:
                              index < notes.length ? Colors.red : Colors.green,
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
                // Column(
                //   children: [
                //     Flexible(
                //       child: ListView.builder(
                //           itemCount: notes.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon: const Icon(Icons.circle_outlined),
                //                   color: Colors.red,
                //                   iconSize: 25,
                //                 ),
                //                 Flexible(
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 10, right: 40, top: 15),
                //                     child: SizedBox(
                //                       width: double.infinity,
                //                       child: Text(
                //                         notes[index].description,
                //                         overflow: TextOverflow.clip,
                //                         maxLines: 5,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             );
                //           }),
                //     ),
                //     Container(
                //       height: 2,
                //       width: double.infinity,
                //       color: Colors.grey,
                //     ),
                //     Flexible(
                //       child: ListView.builder(
                //           itemCount: notes.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon: const Icon(Icons.circle_outlined),
                //                   color: Colors.red,
                //                   iconSize: 25,
                //                 ),
                //                 Flexible(
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 10, right: 40, top: 15),
                //                     child: SizedBox(
                //                       width: double.infinity,
                //                       child: Text(
                //                         notes[index].description,
                //                         overflow: TextOverflow.clip,
                //                         maxLines: 5,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             );
                //           }),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.circle_outlined),
                                  color: Colors.red,
                                  iconSize: 25,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 40, top: 15),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        notes[index].description,
                                        overflow: TextOverflow.clip,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.circle_outlined),
                                  color: Colors.red,
                                  iconSize: 25,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 40, top: 15),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        notes[index].description,
                                        overflow: TextOverflow.clip,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
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
