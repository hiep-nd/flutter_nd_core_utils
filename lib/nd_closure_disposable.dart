import 'package:flutter/foundation.dart';
import 'package:nd_core_utils/nd_disposable.dart';

mixin NDClosureDisposable on NDDisposable {
  // NDDisposable
  @override
  @mustCallSuper
  void dispose() {
    onDispose?.call();
  }

  // NDClosureDisposable
  late final void Function()? onDispose;
}
