import 'package:efymen/models/QNote.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class QuickNote extends StatefulWidget {
  const QuickNote({super.key});

  @override
  State<QuickNote> createState() => _QuickNoteState();
}

class _QuickNoteState extends State<QuickNote> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    List<QNote> notes = [
      QNote("have to get a red pen ", 'red'),
      QNote(
          "download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download download Spiderman movie Mission imposible 5 movie download",
          'blue'),
      QNote("download Spiderman movie Mission imposible 5 movie download ",
          'blue'),
      QNote("Mission imposible 5 movie download", 'green'),
      QNote("Mission imposible 5 movie download", 'green'),
      QNote("Mission imposible 5 movie download", 'green'),
      QNote("Mission imposible 5 movie download", 'green'),
    ];
    // List<QNote> sheduled = [
    //   QNote("have to get a red pen", 'red'),
    //   QNote("download Spiderman movie", 'blue'),
    // ];
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuickNote",
      home: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: const CommonAppBar(
          textTitle: "Todo",
        ),
        body: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndecator(
                      color: Colors.grey.shade400, radius: 4),
                  unselectedLabelColor: colorScheme.onBackground,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: "Quick Note"),
                    Tab(text: "Scheduled"),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndecator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndecator({required this.color, required this.radius});

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
