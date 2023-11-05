//
// nd_disposable_bag.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Wed Jun 08 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/nd_core_utils.dart';

T noLeaks<T>(T Function(NDDisposableBag bag) action) {
  final bag = NDDisposableBag();
  try {
    return action(bag);
  } finally {
    bag.dispose();
  }
}

T ndNoLeaks<T>(T Function(NDDisposableBag bag) action) => noLeaks(action);

extension NDDisposableBagUtils on NDDisposable {
  /// Adds `this` to `bag`
  ///
  /// - parameter bag: `NDDisposableBag` to add `this` to.
  void disposedBy(NDDisposableBag bag) {
    bag.insert(this);
  }
}

class NDDisposableBag implements NDDisposable {
  // NDDisposable
  /// This is internal on purpose, take a look at `CompositeDisposable` instead.
  @override
  void dispose() {
    final oldDisposables = List<NDDisposable>.unmodifiable(_disposables);
    _disposables.clear();
    _isDisposed = true;

    for (var disposable in oldDisposables) {
      disposable.dispose();
    }
  }

  @override
  bool get isDisposed => _isDisposed;

  /// Adds `disposable` to be disposed when dispose bag is being deinited.
  ///
  /// - parameter disposable: Disposable to add.
  void insert(NDDisposable disposable) {
    if (isDisposed) {
      disposable.dispose();
      return;
    }

    _disposables.add(disposable);
  }

  // Privates
  // state
  final _disposables = <NDDisposable>[];
  bool _isDisposed = false;
}
