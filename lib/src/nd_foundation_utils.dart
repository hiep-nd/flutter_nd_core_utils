//
// nd_foundation_utils.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/foundation.dart';

void doInDebugMode(void Function() action, {bool debugModeOnly = true}) {
  if (!debugModeOnly || kDebugMode) {
    action();
  }
}

void ndDoInDebugMode(void Function() action, {bool debugModeOnly = true}) =>
    doInDebugMode(action, debugModeOnly: debugModeOnly);
