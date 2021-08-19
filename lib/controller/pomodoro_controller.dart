import 'dart:async';

import 'package:get/get.dart';

enum TypeInterval { WORK, REST }

class Controller extends GetxController {
  final _start = false.obs;
  get start => this._start.value;
  set start(value) => this._start.value = value;

  RxInt minutes = 2.obs;

  RxInt seconds = 0.obs;

  RxInt timeWork = 2.obs;

  RxInt timeRest = 1.obs;

  Rx<TypeInterval> typeInterval = Rx<TypeInterval>(TypeInterval.WORK);

  Timer? stopwatch;

  void started() {
    start = true;
    stopwatch = Timer.periodic(
      Duration(milliseconds: 50),
      (timer) {
        if (minutes.value == 0 && seconds.value == 0) {
          _switchIntervalType();
        } else if (seconds.value == 0) {
          seconds.value = 59;
          minutes.value--;
        } else {
          seconds.value--;
        }
      },
    );
  }

  void stop() {
    start = false;
    stopwatch?.cancel();
  }

  void restart() {
    start = false;
    stop();
    minutes.value = isWork() ? timeWork.value : timeRest.value;
    seconds.value = 0;
  }

  void incrementTimeWork() {
    timeWork.value++;
    if (isWork()) {
      restart();
    }
  }

  void decrementTimeWork() {
    if (timeWork.value > 1) {
      timeWork.value--;
      if (isWork()) {
        restart();
      }
    }
  }

  void incrementTimeRest() {
    timeRest.value++;
    if (isRest()) {
      restart();
    }
  }

  void decrementTimeRest() {
    if (timeRest.value > 1) {
      timeRest.value--;
      if (isRest()) {
        restart();
      }
    }
  }

  bool isWork() {
    return typeInterval.value == TypeInterval.WORK;
  }

  bool isRest() {
    return typeInterval.value == TypeInterval.REST;
  }

  void _switchIntervalType() {
    if (isWork()) {
      typeInterval.value = TypeInterval.REST;
      minutes.value = timeRest.value;
    } else {
      typeInterval.value = TypeInterval.WORK;
      minutes.value = timeWork.value;
    }
    seconds.value = 0;
  }
}
