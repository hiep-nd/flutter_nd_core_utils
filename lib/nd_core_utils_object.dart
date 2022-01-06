//
//  nd_core_utils_object.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.

extension NDCoreUtilsObject<T, E> on T {
  E map(E Function(T value) mapper) {
    return mapper(this);
  }
}

E ndMap<T, E>(self, E Function(T value) mapper) => self.map(mapper);
