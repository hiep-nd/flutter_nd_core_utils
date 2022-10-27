//
// nd_nullable.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

class NDNullable<T> {
  T get value {
    if (_hasValue) {
      return _value;
    }

    throw _NDNullableError('Unwrap used on a null value');
  }

  bool get hasValue => _hasValue;

  NDNullable.$null() : _hasValue = false;

  NDNullable(T value)
      : _hasValue = true,
        _value = value;

  // Privates
  final bool _hasValue;
  late final T _value;
}

/// Error thrown by the runtime system when an NDNullable statement fails.
class _NDNullableError extends TypeError {
  /// Message describing the NDNullable error.
  final Object? message;

  /// Creates an NDNullable error with the provided [message].
  _NDNullableError([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "NDNullable failed: ${Error.safeToString(message)}";
    }
    return "NDNullable failed";
  }
}
