import 'package:flutter/foundation.dart';

abstract class NDDisposable {
  @mustCallSuper
  void dispose();

  @visibleForTesting
  bool get isDisposed => throw UnimplementedError(
      'isDisposed is not implemented by ${runtimeType.toString()}');
}
