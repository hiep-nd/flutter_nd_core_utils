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

    final list = <dynamic>[];
    final separatered = list.insertSeparator(10);
    expect(separatered, <dynamic>[]);

    list.add(1);
    expect(separatered, [1]);

    list.add(2);
    expect(separatered, [1, 10, 2]);

    list.add(3);
    expect(separatered, [1, 10, 2, 10, 3]);

    list.remove(2);
    expect(separatered, [1, 10, 3]);
  });

  test('Test NDCoreUtilsIterable.insertLead', () {
    expect(<int>[].insertLead(10).toList(), <int>[]);
    expect(<int>[1].insertLead(10).toList(), <int>[10, 1]);
    expect(<int>[1, 2].insertLead(10).toList(), <int>[10, 1, 2]);

    final list = <dynamic>[];
    final leaded = list.insertLead(10);
    expect(leaded, <dynamic>[]);

    list.add(1);
    expect(leaded, [10, 1]);

    list.add(2);
    expect(leaded, [10, 1, 2]);
  });

  test('Test NDCoreUtilsIterable.insertTrail', () {
    expect(<int>[].insertTrail(10).toList(), <int>[]);
    expect(<int>[1].insertTrail(10).toList(), <int>[1, 10]);
    expect(<int>[1, 2].insertTrail(10).toList(), <int>[1, 2, 10]);

    final list = <dynamic>[];
    final trailed = list.insertTrail(10);
    expect(trailed, <dynamic>[]);

    list.add(1);
    expect(trailed, [1, 10]);

    list.add(2);
    expect(trailed, [1, 2, 10]);
  });

  test('Test NDCoreUtilsIterable.startsWith', () {
    expect(<int>[].startsWith([1, 2]), false);
    expect(<int>[1].startsWith([1, 2]), false);
    expect(<int>[1, 2].startsWith([1, 2]), true);
    expect(<int>[0, 1, 2].startsWith([1, 2]), false);
    expect(<int>[1, 2, 0].startsWith([1, 2]), true);
  });
}
