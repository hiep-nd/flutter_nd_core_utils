//
// nd_disposable_bag_test.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Wed Jun 08 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

class _Disposable implements NDDisposable {
  @override
  void dispose() {
    _isDisposed = true;
  }

  @override
  bool get isDisposed => _isDisposed;

  bool _isDisposed = false;
}

void main() {
  test('Test NDDisposableBag', () {
    final bag = NDDisposableBag();
    expect(bag.isDisposed, false);

    var disposeable = _Disposable();
    bag.insert(disposeable);
    expect(disposeable.isDisposed, false);

    bag.dispose();
    expect(bag.isDisposed, true);
    expect(disposeable.isDisposed, true);

    disposeable = _Disposable();
    bag.insert(disposeable);
    expect(disposeable.isDisposed, true);
  });
}
