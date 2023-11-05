//
// nd_closure_disposable.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/foundation.dart';
import 'package:nd_core_utils/src/nd_disposable.dart';

mixin NDClosureDisposable on NDDisposable {
  // NDClosureDisposable
  void Function()? disposeHanlder;

  // NDDisposable
  @override
  @mustCallSuper
  void dispose() {
    if (_isDisposed) {
      return;
    }

    disposeHanlder?.call();
    _isDisposed = true;
  }

  @override
  bool get isDisposed => _isDisposed;

  // Privates
  bool _isDisposed = false;
}
