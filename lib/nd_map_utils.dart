//
//  nd_map_utils.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

extension NDMapUtils<K, V> on Map<K, V> {
  Map<V, K> invert() => map((key, value) => MapEntry(value, key));

  Map<V, K> ndInvert() => invert();

  void set(K key, V? value) {
    if (value == null) {
      remove(key);
    } else {
      this[key] = value;
    }
  }

  void ndSet(K key, V? value) => set(key, value);
}
