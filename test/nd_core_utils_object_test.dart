//
//  nd_core_utils_object_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDCoreUtilsObject.map', () {
    int? value = 100;
    expect(value.map((v) => v + 1), 101);
    expect(value.map((v) => v.isEven ? null : 1), null);

    value = null;
    expect(value?.map((v) => v + 1), null);
  });

  test('Test NDCoreUtilsObject.to', () {
    double value = 100.0;
    expect(value.to<num>(), 100);
    expect(value.to<String>(), null);
  });
}
