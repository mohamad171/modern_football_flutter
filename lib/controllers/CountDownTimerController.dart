import 'dart:async';

import 'package:get/get.dart';

class CountDownTimerController extends GetxController {
  var SCount = 60.obs;
  var default_value;
  late Timer _timer;

  CountDownTimerController(this.default_value);

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
    SCount = 60.obs;
    update();
  }

  void reset_timer() {
    _timer.cancel();
    SCount = default_value;
    update();
  }
}
