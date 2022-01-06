//
//  nd_core_utils_iterable_nullable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

extension NDCoreUtilsIterableNullable<E> on Iterable<E?> {
  Iterable<E> notNull() {
    return expand((element) => element == null ? [] : [element]);
  }
}
