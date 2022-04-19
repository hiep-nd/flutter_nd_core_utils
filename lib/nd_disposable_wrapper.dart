import 'package:nd_core_utils/nd_disposable.dart';

class NDDisposableWrapper<T extends NDDisposable> {
  T? get value => _value;
  void reset() => value = null;
  set value(T? value) {
    _value?.dispose();
    _value = value;
  }

  NDDisposableWrapper(T? value) : _value = value;

  // Privates
  T? _value;
}
