import 'dart:async';

import 'package:get/get.dart';

class CountDownTimerController extends GetxController {
  var SCount = 60.obs;
  var default_value = 60;
  late Timer _timer;

  CountDownTimerController();

  void start_timer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (SCount > 0) {
        SCount--;
        update();
      } else {
        _timer.cancel();
      }
    });
  }

  void stop_timer() {
    _timer.cancel();
    SCount(default_value);
    update();
  }

  void reset_timer() {
    _timer.cancel();
    SCount(default_value);
    update();
  }
}
