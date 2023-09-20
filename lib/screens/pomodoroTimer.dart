import 'dart:async';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PomodoroTimerPage extends StatefulWidget {
  const PomodoroTimerPage({super.key});
  @override
  PomodoroTimerPageState createState() => PomodoroTimerPageState();
}

class PomodoroTimerPageState extends State<PomodoroTimerPage> {
  static const countdownDuration = Duration(minutes: 25);
  Duration duration = const Duration();
  Timer? timer;

  bool countDown = true;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    Size container = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: 'Pomodoro Timer',
      ),
      body: Stack(children: [
        Positioned(
          left: -container.width / 1.65,
          top: container.height / 25,
          child: Container(
            width: 450,
            height: 450,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.1,
                image: AssetImage("assets/icons/img1.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: -container.width / 6,
          bottom: container.height / 20,
          child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.1,
                image: AssetImage("assets/icons/img2.png"),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTime(),
              const SizedBox(
                height: 80,
              ),
              buildButtons()
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildTime() {
    Size container = MediaQuery.of(context).size;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Container(
      height: container.width / 2,
      width: container.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(container.width / 2),
          color: Colors.amber),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTimeCard(time: minutes),
                const Center(
                  child: Text(':',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 40)),
                ),
                buildTimeCard(time: seconds),
              ]),
          Divider(
            height: 2,
            thickness: 2,
            indent: container.width / 6,
            endIndent: container.width / 6,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "25:00",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget buildTimeCard({required String time}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 50),
            ),
          ),
        ],
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  }
                },
                child: const SizedBox(
                  height: 20,
                  width: 50,
                  child: Text('Stop'),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: stopTimer,
                child: const SizedBox(
                  height: 200,
                  width: 100,
                  child: Text('Cancel'),
                ),
              ),
            ],
          )
        : InkWell(
            onTap: () {
              startTimer();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.amber),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black45, blurRadius: 1)],
              ),
            ),
          );
  }
}
