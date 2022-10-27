//
//  nd_core_utils_object.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.

import 'package:nd_core_utils/src/nd_etc.dart';

extension NDCoreUtilsObject<T> on T {
  E map<E>(E Function(T value) mapper) {
    return mapper(this);
  }

  E ndMap<E>(E Function(T value) mapper) => map(mapper);

  E? to<E>() => cast<E>(this);

  E? ndTo<E>() => to<E>();
}
