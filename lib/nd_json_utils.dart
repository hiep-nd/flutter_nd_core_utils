import 'package:nd_core_utils/nd_etc.dart';

typedef NDJsObject = Map<String, dynamic>;
typedef NDJsArray = List<dynamic>;

extension NDJsObjectUtils on NDJsObject {
  E? getAs<E>(String key) => cast<E>(this[key]);

  E? ndGetAs<E>(String key) => getAs<E>(key);
}

extension NDJsArrayUtils on NDJsArray {
  E? getAs<E>(int index) =>
      (0 <= index && index < length) ? cast<E>(this[index]) : null;

  E? ndGetAs<E>(int index) => getAs(index);
}
