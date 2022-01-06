//
//  key_observer.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

class ClosureIterator<T> implements Iterator<T> {
  final T Function() _currentFunction;
  final bool Function() _moveNextFunction;

  ClosureIterator({
    required T Function() current,
    required bool Function() moveNext,
  })  : _currentFunction = current,
        _moveNextFunction = moveNext;

  @override
  T get current => _currentFunction();

  @override
  bool moveNext() => _moveNextFunction();
}
