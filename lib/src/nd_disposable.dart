//
// nd_disposable.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/foundation.dart';

abstract class NDDisposable {
  @mustCallSuper
  void dispose();

  @visibleForTesting
  bool get isDisposed => throw UnimplementedError(
      'isDisposed is not implemented by ${runtimeType.toString()}');
}
