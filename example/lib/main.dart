// ignore_for_file: avoid_print

import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  var list = <int>[1, 3, 2, 4];
  var it2 = ClosureIterable(get: () {
    final it = list.iterator;
    return ClosureIterator(
        current: () => it.current * 2, moveNext: () => it.moveNext());
  });

  // [2, 6, 4, 8]
  print(it2);
}
