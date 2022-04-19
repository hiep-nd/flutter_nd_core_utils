//
//  nd_core_utils_iterable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_core_utils/nd_closure_iterable.dart';
import 'package:nd_core_utils/nd_closure_iterator.dart';

extension NDCoreUtilsIterable<E> on Iterable<E> {
  static const prevFirst = 1 << 0;
  static const item = 1 << 1;
  static const first = 1 << 2;
  static const last = 1 << 3;
  static const nextLast = 1 << 4;

  Iterable<E> insertSeparator(E value) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = prevFirst;
      final sub = <E>[];
      int subIndex = 0;
      return NDClosureIterator(
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

            if (state == prevFirst) {
              // preFirst
              if (it.moveNext()) {
                state = item;

                // move parent it next
                sub.add(it.current);
                if (it.moveNext()) {
                  // not last
                  sub.add(value);
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
              sub.add(value);
            } else {
              // set last
              state = state | last;
            }
            return true;
          });
    });
  }

  Iterable<E> ndInsertSeparator(E value) => insertSeparator(value);

  Iterable<E> insertLead(E value) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = prevFirst;
      var isLead = false;
      return NDClosureIterator(
          current: () => isLead ? value : it.current,
          moveNext: () {
            if (isLead) {
              isLead = false;
              return true;
            }

            if (state == prevFirst) {
              // preFirst
              if (it.moveNext()) {
                state = first & item;
                isLead = true;
                return true;
              } else {
                return false;
              }
            }

            return it.moveNext();
          });
    });
  }

  Iterable<E> ndInsertLead(E value) => insertLead(value);

  Iterable<E> insertTrail(E value) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = prevFirst;
      var isTrail = false;
      E? buffer;
      return NDClosureIterator(
          current: () => isTrail ? value : buffer!,
          moveNext: () {
            if (state & prevFirst != 0) {
              // preFirst
              if (it.moveNext()) {
                // first
                state = first | item;
                buffer = it.current;
                if (it.moveNext()) {
                } else {
                  // last
                  state |= last;
                }
                return true;
              } else {
                // no items
                state |= nextLast;
                return false;
              }
            }

            // item
            if (state & item != 0) {
              // first
              if (state & first != 0) {
                state &= (~first);
              }

              // not last
              if (state & last == 0) {
                buffer = it.current;
                if (it.moveNext()) {
                } else {
                  state |= last;
                }
                return true;
              }

              // last
              state = nextLast;
              isTrail = true;
              buffer = null;
              return true;
            }

            // nextLast
            if (isTrail) {
              // isTrail
              isTrail = false;
            }
            return false;
          });
    });
  }

  bool startsWith(Iterable<E> value) {
    final it = iterator;
    final subIt = value.iterator;
    while (subIt.moveNext()) {
      if (!it.moveNext() || it.current != subIt.current) {
        return false;
      }
    }
    return true;
  }

  bool ndStartsWith(Iterable<E> value) => startsWith(value);
}
