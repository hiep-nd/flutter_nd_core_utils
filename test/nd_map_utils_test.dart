//
//  nd_map_utils_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDMapUtils.map', () {
    expect({0: 'zero', 1: 'one', 2: 'two'}.invert(),
        {'zero': 0, 'two': 2, 'one': 1});
  });
}
