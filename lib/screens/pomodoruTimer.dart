import 'dart:ffi';

import 'package:efymen/widgets/timer.dart';
import 'package:get/get.dart';

import '../widgets/appbar.dart';
import 'package:flutter/material.dart';

class PomodoruTimer extends GetView<TimerController> {
  const PomodoruTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        textTitle: 'Pomodoru Timer',
      ),
      body: Container(
        height: 400,
        width: 200,
        child: Obx(() => Text(controller.time.value)),
      ),
    );
  }
}
