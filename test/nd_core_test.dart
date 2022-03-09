//
// nd_core_test.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Wed Mar 09 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() async {
  test('Nullable', () {
    const String? stringNull = null;
    expect(stringNull is int?, true);
    expect(stringNull is int, false);

    const int? intNull = null;
    // ignore: unrelated_type_equality_checks
    expect(intNull == stringNull, true);
  });

  test('Asyn call', () async {
    final texts = <String>[];

    Future<void> do1(Future<void> Function() fn) async {
      texts.add('do1 - start');
      await fn();
      texts.add('do1 - end');
    }

    await do1(() async {
      texts.add('fn - start');
      final int i = await Future.delayed(const Duration(milliseconds: 100), () {
        texts.add('Future');
        return 100;
      });
      texts.add('$i');
      texts.add('fn - end');
    });
    expect(texts, [
      'do1 - start',
      'fn - start',
      'Future',
      '100',
      'fn - end',
      'do1 - end',
    ]);
  });
}
