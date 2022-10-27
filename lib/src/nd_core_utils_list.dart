//
// nd_core_utils_list.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Mon Jan 17 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/src/nd_core_utils_iterable.dart';
import 'package:nd_core_utils/src/nd_etc.dart';

extension NDCoreUtilsList<E> on List<E> {
  V? getAs<V>(int index) =>
      (0 <= index && index < length) ? cast<V>(this[index]) : null;

  V? ndGetAs<V>(int index) => getAs(index);
}

extension NDCoreUtilsList2<E> on List<E?> {
  List<E> notNullInsertSeparator(E value) =>
      notNull().insertSeparator(value).toList();

  List<E> ndNotNullInsertSeparator(E value) => notNullInsertSeparator(value);
}
