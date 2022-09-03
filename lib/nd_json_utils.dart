import 'package:nd_core_utils/nd_etc.dart';

typedef NDJsObject = Map<String, dynamic>;
typedef NDJsArray = List<dynamic>;

extension NDJsObjectUtils on NDJsObject {
  E? getAt<E>(String key) => ndCast<E>(this[key]);
}

extension NDJsArrayUtils on NDJsArray {
  E? getAt<E>(int index) => ndCast<E>(this[index]);
  E? getOrNullAt<E>(int index) =>
      (0 <= index && index < length) ? ndCast<E>(this[index]) : null;
}
