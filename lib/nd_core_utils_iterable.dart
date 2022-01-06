//
//  nd_core_utils_iterable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_core_utils/closure_iterable.dart';
import 'package:nd_core_utils/closure_iterator.dart';

extension NDCoreUtilsIterable<E> on Iterable<E> {
  Iterable<E> insertSeparator(E separator) {
    return ClosureIterable(get: () {
      const preFirst = 1 << 0;
      const item = 1 << 1;
      const last = 1 << 3;
      const nextLast = 1 << 4;

      final it = iterator;
      var state = preFirst;
      final sub = <E>[];
      int subIndex = 0;
      return ClosureIterator(
          current: () => sub[subIndex],
          moveNext: () {
            if (1 + subIndex < sub.length) {
              // in midle sub
              subIndex++;
              return true;
            }

            if ((state & nextLast) != 0) {
              return false;
            }

            if ((state & last) != 0) {
              state = nextLast;
              return false;
            }

            if (state == preFirst) {
              // preFirst
              if (it.moveNext()) {
                state = item;

                // move parent it next
                sub.add(it.current);
                if (it.moveNext()) {
                  // not last
                  sub.add(separator);
                } else {
                  // set last
                  state = state | last;
                }
                return true;
              } else {
                state = state | nextLast;
                return false;
              }
            }

            // not last, not preFirst
            // prepare new sub & subIndex
            sub.clear();
            subIndex = 0;

            // move parent it next
            sub.add(it.current);
            if (it.moveNext()) {
              // not last
              sub.add(separator);
            } else {
              // set last
              state = state | last;
            }
            return true;
          });
    });
  }
}
