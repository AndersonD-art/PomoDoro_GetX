import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_getx/components/stopwatch_button.dart';
import 'package:pomodoro_getx/controller/pomodoro_controller.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Obx(
      () => Container(
        color: controller.isWork() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.isWork() ? 'Hora de Trabalhar' : 'Hora de Descansar',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${controller.minutes.toString().padLeft(2, '0')}:${controller.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!controller.start)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopWatchButton(
                      text: 'Iniciar',
                      icon: Icons.play_arrow,
                      click: controller.started,
                    ),
                  ),
                if (controller.start)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopWatchButton(
                      text: 'Parar',
                      icon: Icons.stop,
                      click: controller.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: StopWatchButton(
                    text: 'Reiniciar',
                    icon: Icons.refresh,
                    click: controller.restart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
