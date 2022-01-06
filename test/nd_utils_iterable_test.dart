//
//  nd_core_utils_iterable_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDCoreUtilsIterable.insertSeparator', () {
    expect(<int>[].insertSeparator(10).toList(), <int>[]);
    expect(<int>[1].insertSeparator(10).toList(), <int>[1]);
    expect(<int>[1, 2].insertSeparator(10).toList(), <int>[1, 10, 2]);
    expect(
        <int>[1, 10, 2].insertSeparator(10).toList(), <int>[1, 10, 10, 10, 2]);

    final list = [];
    final separatered = list.insertSeparator(10);
    expect(separatered, []);

    list.add(1);
    expect(separatered, [1]);

    list.add(2);
    expect(separatered, [1, 10, 2]);

    list.add(3);
    expect(separatered, [1, 10, 2, 10, 3]);

    list.remove(2);
    expect(separatered, [1, 10, 3]);
  });
}
