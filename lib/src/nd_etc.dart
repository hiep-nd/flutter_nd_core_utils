//
// nd_etc.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/src/logger.dart';

void setIfNeeded<T>(
  T Function() getter,
  void Function(T) setter,
  T Function() valuer,
) {
  final v = valuer();
  if (getter() != v) {
    setter(v);
  }
}

void ndSetIfNeeded<T>(
  T Function() getter,
  void Function(T) setter,
  T Function() valuer,
) =>
    setIfNeeded(
      getter,
      setter,
      valuer,
    );

T? cast<T>(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is T) {
    return value;
  }

  logger.info(
      'cast: Expected a value of type \'$T\', but got one of type \'${value.runtimeType}\'');
  return null;
}

T? ndCast<T>(dynamic value) => cast<T>(value);

T? noExceptions<T>(T Function() action) {
  try {
    return action();
  } on Exception catch (e) {
    logger.info(e.toString());
    return null;
  }
}

T? ndNoExceptions<T>(T Function() action) => noExceptions(action);
