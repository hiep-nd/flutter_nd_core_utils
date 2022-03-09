//
// nd_debounced_action_test.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Thu Mar 03 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() async {
  test('Test NDDebouncedAction', () async {
    const duration = Duration(milliseconds: 200);

    final deboncedAction = NDDebouncedAction1<DateTime, int>(
      duration: duration,
      action: (int index) {
        final now = DateTime.now();
        return now;
      },
    );

    var futureResults = <Future<NDDebouncedActionRunResult<DateTime>>>[];

    final callTime = <DateTime>[];
    // run 4 quick actions, no actions is run
    for (var i = 0; i < 5; i++) {
      Timer(Duration(milliseconds: 10 * (i + 1)), () async {
        callTime.add(DateTime.now());
        futureResults.add(deboncedAction.run1(i));
      });
    }

    await Future.delayed(const Duration(milliseconds: 60), () {});
    final results = await Future.wait(futureResults);
    expect(results.length, 5);
    expect(results[0].didRun, false);
    expect(results[1].didRun, false);
    expect(results[2].didRun, false);
    expect(results[3].didRun, false);
    expect(results[4].didRun, true);
    expect(results[4].result.difference(callTime[4]), greaterThan(duration));
  });
}
