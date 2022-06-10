//
// nd_auto_release.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Fri Jun 10 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:nd_core_utils/nd_disposable.dart';

abstract class NDAutoRelease<T> {
  NDAutoRelease(this._value);

  T? get value => _value;

  set value(T? v) {
    if (_value != null) {
      release(_value!);
    }

    _value = v;
  }

  void release(T v);

  // Privates
  T? _value;
}

extension NDAutoReleaseUtils<T> on NDAutoRelease<T> {
  void reset() => value = null;
}

class NDAutoReleaseClosure<T> extends NDAutoRelease<T> {
  // NDAutoRelease
  @override
  void release(T v) => _release(v);

  // NDAutoReleaseClosure
  NDAutoReleaseClosure(this._release, [T? v]) : super(v);

  // Privates
  final void Function(T) _release;
}

class NDAutoTimer extends NDAutoRelease<Timer> {
  // NDAutoRelease
  @override
  void release(Timer v) => v.cancel();

  // NDAutoTimer
  NDAutoTimer([Timer? value]) : super(value);
}

class NDAutoDisposable<T extends NDDisposable> extends NDAutoRelease<T> {
  // NDAutoDisposable
  @override
  void release(T v) => v.dispose();

  // NDAutoRelease
  NDAutoDisposable([T? value]) : super(value);
}
