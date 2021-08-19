import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_getx/controller/pomodoro_controller.dart';

class InputTime extends StatelessWidget {
  final int interval;
  final String title;
  final void Function()? inc;
  final void Function()? dec;
  const InputTime({
    Key? key,
    required this.interval,
    required this.title,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: this.dec,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                primary: controller.isWork() ? Colors.red : Colors.green,
              ),
            ),
            Text(
              '${this.interval} min',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            ElevatedButton(
              onPressed: this.inc,
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                primary: controller.isWork() ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
