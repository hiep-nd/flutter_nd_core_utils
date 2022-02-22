//
//  nd_core_utils_iterable_nullable_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDCoreUtilsIterableNullable.notNull', () {
    final list = <int?>[];
    final notNull = list.notNull();
    expect(notNull, []);

    list.add(1);
    expect(notNull, [1]);

    list.add(2);
    expect(notNull, [1, 2]);

    list.add(null);
    expect(notNull, [1, 2]);

    list.remove(2);
    expect(notNull, [1]);
  });
}
