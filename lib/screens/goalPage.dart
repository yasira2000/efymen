import 'package:efymen/models/goal.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatelessWidget {
  final List<Goal> goals = [
    Goal('Nethma and I should finish my degree with second upper'),
    Goal(
      'baba and I should finish my degree with second upper',
    ),
    Goal('Gona and I should finish my degree with second upper'),
    Goal('Booruwa and I should finish my degree with second upper'),
    Goal(
      'Wassa and I should finish my degree with second upper',
    ),
  ];
  GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size container = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: 'Goals',
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: container.width / 4.1),
                  child: const Text(
                    'STRIVE FOR',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: container.width / 4.1),
                  child: const Text('PROGRESS',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        letterSpacing: 2,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: container.width / 2.5),
                  child: const Text('NOT PERFECTION',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 2,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: Container(
              width: double.infinity,
              height: container.height * 2 / 5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/goal.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10.0,
                          bottom: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VerticalDivider(
                              width: 10,
                              thickness: 3,
                              color: Color(0xFFFFC400),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: container.width / 1.4,
                                child: Text(
                                  goals[index].description,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFFFFC400),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.5,
                                          offset: Offset(0, 1))
                                    ]),
                                child: const Icon(
                                  Icons.bar_chart,
                                  color: Colors.white,
                                  size: 20,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.5,
                                        offset: Offset(0, 1))
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
