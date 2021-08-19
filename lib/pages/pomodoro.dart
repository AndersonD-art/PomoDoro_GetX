import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_getx/components/input_time.dart';
import 'package:pomodoro_getx/components/stopwatch.dart';
import 'package:pomodoro_getx/controller/pomodoro_controller.dart';

class PomoDoro extends StatelessWidget {
  const PomoDoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTime(
                    interval: controller.timeWork.value,
                    title: 'Trabalho',
                    inc: controller.start && controller.isWork()
                        ? null
                        : controller.incrementTimeWork,
                    dec: controller.start && controller.isWork()
                        ? null
                        : controller.decrementTimeWork,
                  ),
                  InputTime(
                    interval: controller.timeRest.value,
                    title: 'Descanso',
                    inc: controller.start && controller.isRest()
                        ? null
                        : controller.incrementTimeRest,
                    dec: controller.start && controller.isRest()
                        ? null
                        : controller.decrementTimeRest,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
