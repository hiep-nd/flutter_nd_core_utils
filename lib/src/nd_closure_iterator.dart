//
//  nd_closure_iterator.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

class NDClosureIterator<T> implements Iterator<T> {
  final T Function() _currentFunction;
  final bool Function() _moveNextFunction;

  NDClosureIterator({
    required T Function() current,
    required bool Function() moveNext,
  })  : _currentFunction = current,
        _moveNextFunction = moveNext;

  @override
  T get current => _currentFunction();

  @override
  bool moveNext() => _moveNextFunction();
}
