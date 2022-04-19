import 'package:flutter/foundation.dart';

abstract class NDDisposable {
  void dispose();

  @visibleForTesting
  bool get isDisposed;
}
