import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import '../../di/providers/general_providers/shared_preferences.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  String timeLeft(int secondsLeft) {
    DateTime dtNow = DateTime.now();
    var dateDiff =
        dtNow.difference(dtNow.subtract(Duration(seconds: secondsLeft)));
    String _secondsLeft = (dateDiff.inSeconds - (dateDiff.inMinutes * 60))
        .toString()
        .padLeft(2, '0');
    String _minLeft = dateDiff.inMinutes.toString().padLeft(2, '0');
    return "$_minLeft:$_secondsLeft";
  }

  String dateToMMSS(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    if (h > 0) {
      m = h * 60;
    }

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$minuteLeft:$secondsLeft";

    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = 0;//ref.watch(counterProvider);
    return Text("Counter ticking: ${timeLeft(count)}");
  }
}
