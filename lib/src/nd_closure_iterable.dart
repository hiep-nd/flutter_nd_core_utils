//
//  nd_closure_iterable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

class NDClosureIterable<T> extends Iterable<T> {
  final Iterator<T> Function() _getFunction;
  NDClosureIterable({required Iterator<T> Function() get}) : _getFunction = get;
  @override
  Iterator<T> get iterator => _getFunction();
}
