import 'package:flutter/foundation.dart';
import 'package:nd_core_utils/nd_disposable.dart';

abstract class NDClosureDisposable extends NDDisposable {
  // NDDisposable
  @override
  @mustCallSuper
  void dispose() {
    onDispose?.call();
  }

  // NDClosureDisposable
  final void Function()? onDispose;

  NDClosureDisposable({this.onDispose});
}
