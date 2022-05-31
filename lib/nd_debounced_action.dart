//
// nd_debounced_action.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Thu Mar 01 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nd_core_utils/nd_disposable.dart';

class NDDebouncedActionRunResult<T> {
  T get result => _result!;
  final bool didRun;

  const NDDebouncedActionRunResult(this.didRun, [this._result]);
  final T? _result;
}

class _NDDebouncedAction implements NDDisposable {
  final Duration duration;

  _NDDebouncedAction({
    required this.duration,
  });

  @mustCallSuper
  @override
  void dispose() {
    timer?.cancel();
    timer = null;
  }

  @protected
  Timer? timer;

  @override
  bool get isDisposed => timer == null;
}

class NDDebouncedAction<R> extends _NDDebouncedAction {
  final R Function() action;

  NDDebouncedAction({
    Duration duration = const Duration(milliseconds: 500),
    required this.action,
  }) : super(duration: duration);

  Future<NDDebouncedActionRunResult<R>> call() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
      _completer?.complete(const NDDebouncedActionRunResult(false));
    }

    final completer = Completer<NDDebouncedActionRunResult<R>>();
    timer = Timer(duration, () {
      try {
        completer.complete(NDDebouncedActionRunResult(true, action()));
      } catch (err, trace) {
        completer.completeError(err, trace);
      }
    });
    _completer = completer;
    return completer.future;
  }

  Future<NDDebouncedActionRunResult<R>> Function() toAction() => (() => call());

  Completer<NDDebouncedActionRunResult<R>>? _completer;
}

class NDDebouncedAction1<R, P> extends _NDDebouncedAction {
  final R Function(P) action;

  NDDebouncedAction1({
    Duration duration = const Duration(milliseconds: 500),
    required this.action,
  }) : super(duration: duration);

  @Deprecated('Use call instead. Will be removed in 1.1')
  Future<NDDebouncedActionRunResult<R>> run1(P arg) => call(arg);

  Future<NDDebouncedActionRunResult<R>> call(P arg) {
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

  @Deprecated('Use call instead. Will be removed in 1.1')
  Future<NDDebouncedActionRunResult<R>> Function(P) toAction1() => toAction();

  Future<NDDebouncedActionRunResult<R>> Function(P) toAction() =>
      ((arg1) => call(arg1));

  Completer<NDDebouncedActionRunResult<R>>? _completer;
}
