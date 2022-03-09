//
// nd_debounced_action.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Thu Mar 01 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:flutter/foundation.dart';

class NDDebouncedActionRunResult<T> {
  T get result => _result!;
  final bool didRun;

  const NDDebouncedActionRunResult(this.didRun, [this._result]);
  final T? _result;
}

class _NDDebouncedAction {
  final Duration duration;

  _NDDebouncedAction({
    required this.duration,
  });

  @mustCallSuper
  void dispose() {
    timer?.cancel();
  }

  @protected
  Timer? timer;
}

class NDDebouncedAction1<R, P> extends _NDDebouncedAction {
  final R Function(P) action;

  NDDebouncedAction1({
    Duration duration = const Duration(milliseconds: 500),
    required this.action,
  }) : super(duration: duration);

  Future<NDDebouncedActionRunResult<R>> run1(P arg) {
    if (timer?.isActive ?? false) {
      timer?.cancel();
      _completer?.complete(const NDDebouncedActionRunResult(false));
    }

    final completer = Completer<NDDebouncedActionRunResult<R>>();
    timer = Timer(duration, () {
      try {
        completer.complete(NDDebouncedActionRunResult(true, action(arg)));
      } catch (err, trace) {
        completer.completeError(err, trace);
      }
    });
    _completer = completer;
    return completer.future;
  }

  void toAction1() => ((arg1) {
        run1(arg1);
      });

  Completer<NDDebouncedActionRunResult<R>>? _completer;
}
