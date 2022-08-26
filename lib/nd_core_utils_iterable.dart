//
//  nd_core_utils_iterable.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:nd_core_utils/nd_closure_iterable.dart';
import 'package:nd_core_utils/nd_closure_iterator.dart';
import 'package:nd_core_utils/nd_nullable.dart';

extension NDCoreUtilsIterable<E> on Iterable<E> {
  // Insert a separator
  Iterable<E> insertSeparatorMaker(E Function() maker) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = _prevFirst;
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

            if ((state & _nextLast) != 0) {
              return false;
            }

            if ((state & _last) != 0) {
              state = _nextLast;
              return false;
            }

            if (state == _prevFirst) {
              // preFirst
              if (it.moveNext()) {
                state = _item;

                // move parent it next
                sub.add(it.current);
                if (it.moveNext()) {
                  // not _last
                  sub.add(maker());
                } else {
                  // set _last
                  state = state | _last;
                }
                return true;
              } else {
                state = state | _nextLast;
                return false;
              }
            }

            // not _last, not preFirst
            // prepare new sub & subIndex
            sub.clear();
            subIndex = 0;

            // move parent it next
            sub.add(it.current);
            if (it.moveNext()) {
              // not _last
              sub.add(maker());
            } else {
              // set _last
              state = state | _last;
            }
            return true;
          });
    });
  }

  Iterable<E> ndInsertSeparatorMaker(E Function() maker) =>
      insertSeparatorMaker(maker);

  Iterable<E> insertSeparator(E value) => insertSeparatorMaker(() => value);

  Iterable<E> ndInsertSeparator(E value) => insertSeparator(value);

  // Insert a lead
  Iterable<E> insertLeadMaker(E Function() maker) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = _prevFirst;
      var isLead = false;

      var value = NDNullable<E>.$null();
      return NDClosureIterator(current: () {
        if (isLead) {
          if (!value.hasValue) {
            value = NDNullable(maker());
          }
          return value.value;
        }

        return it.current;
      }, moveNext: () {
        if (isLead) {
          isLead = false;
          return true;
        }

        if (state == _prevFirst) {
          // preFirst
          if (it.moveNext()) {
            state = _first & _item;
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

  Iterable<E> ndInsertLeadMaker(E Function() maker) => insertLeadMaker(maker);

  Iterable<E> insertLead(E value) => insertLeadMaker(() => value);

  Iterable<E> ndInsertLead(E value) => insertLead(value);

  // Insert a trail
  Iterable<E> insertTrailMaker(E Function() maker) {
    return NDClosureIterable(get: () {
      final it = iterator;
      var state = _prevFirst;
      var isTrail = false;

      var buffer = NDNullable<E>.$null();
      var value = NDNullable<E>.$null();
      return NDClosureIterator(current: () {
        if (isTrail) {
          if (!value.hasValue) {
            value = NDNullable(maker());
          }
          return value.value;
        }
        return buffer.value;
      }, moveNext: () {
        if (state & _prevFirst != 0) {
          // preFirst
          if (it.moveNext()) {
            // _first
            state = _first | _item;
            buffer = NDNullable(it.current);
            if (it.moveNext()) {
            } else {
              // _last
              state |= _last;
            }
            return true;
          } else {
            // no items
            state |= _nextLast;
            return false;
          }
        }

        // _item
        if (state & _item != 0) {
          // _first
          if (state & _first != 0) {
            state &= (~_first);
          }

          // not _last
          if (state & _last == 0) {
            buffer = NDNullable(it.current);
            if (it.moveNext()) {
            } else {
              state |= _last;
            }
            return true;
          }

          // _last
          state = _nextLast;
          isTrail = true;
          buffer = NDNullable.$null();
          return true;
        }

        // _nextLast
        if (isTrail) {
          // isTrail
          isTrail = false;
        }
        return false;
      });
    });
  }

  Iterable<E> ndInsertTrailMaker(E Function() maker) => insertTrailMaker(maker);

  Iterable<E> insertTrail(E value) => insertTrailMaker(() => value);

  Iterable<E> ndInsertTrail(E value) => insertTrail(value);

  //
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

  // Privates
  static const _prevFirst = 1 << 0;
  static const _item = 1 << 1;
  static const _first = 1 << 2;
  static const _last = 1 << 3;
  static const _nextLast = 1 << 4;
}

extension NDCoreUtilsIterable2<E> on Iterable<E?> {
  Iterable<E> notNull() {
    return expand((element) => element == null ? [] : [element]);
  }

  Iterable<E> ndNotNull() => notNull();
}

extension NDCoreUtilsIterable3<E> on Iterable<E> {
  E? get lastOrNull => isEmpty ? null : last;

  E? get ndLastOrNull => lastOrNull;

  E? get firstOrNull => isEmpty ? null : first;

  E? get ndFirstOrNull => firstOrNull;
}
