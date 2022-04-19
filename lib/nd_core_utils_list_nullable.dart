//
//  nd_core_utils_list_nullable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_core_utils/nd_core_utils_iterable.dart';
import 'package:nd_core_utils/nd_core_utils_iterable_nullable.dart';

extension NDCoreUtilsListNullable<E> on List<E?> {
  List<E> notNullInsertSeparator(E value) =>
      notNull().insertSeparator(value).toList();

  List<E> ndNotNullInsertSeparator(E value) => notNullInsertSeparator(value);
}
