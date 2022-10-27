//
// nd_random_utils.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue Oct 25 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:math';

extension NDRandomUtils on Random {
  List<int> nextPermutation(int n, [int? r]) {
    if (r == null || r < 0 || r > n) {
      r = n;
    }

    final numbers = List.generate(n, (index) => index);
    int numbersCount = n;
    return List.generate(r, (index) {
      final index = nextInt(numbersCount);
      final number = numbers[index];
      numbers[index] = numbers[--numbersCount];
      return number;
    });
  }
}
