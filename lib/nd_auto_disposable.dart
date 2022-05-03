//
// nd_auto_disposable.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue May 03 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/nd_disposable.dart';

class NDAutoDisposable<T extends NDDisposable> {
  T? get value => _value;
  void reset() => value = null;
  set value(T? value) {
    _value?.dispose();
    _value = value;
  }

  NDAutoDisposable(T? value) : _value = value;

  // Privates
  T? _value;
}
