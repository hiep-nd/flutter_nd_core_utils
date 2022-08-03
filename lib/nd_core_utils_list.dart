//
// nd_core_utils_list.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Mon Jan 17 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/nd_core_utils_iterable.dart';

extension NDCoreUtilsList<E> on List<E> {}

extension NDCoreUtilsList2<E> on List<E?> {
  List<E> notNullInsertSeparator(E value) =>
      notNull().insertSeparator(value).toList();

  List<E> ndNotNullInsertSeparator(E value) => notNullInsertSeparator(value);
}
