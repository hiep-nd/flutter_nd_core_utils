//
//  nd_random_utils_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDRandomUtils.nextPermutation', () {
    final random = Random.secure();
    const n = 5;
    {
      final list = random.nextPermutation(n);
      expect(list.length, n);

      final map = <int, bool>{};
      for (var i in list) {
        expect(i, lessThan(n));
        map[i] = true;
      }
      expect(map.length, n);
    }

    const r = 3;
    {
      final list = random.nextPermutation(n, r);
      expect(list.length, r);

      final map = <int, bool>{};
      for (var i in list) {
        expect(i, lessThan(n));
        map[i] = true;
      }
      expect(map.length, r);
    }
  });
}
