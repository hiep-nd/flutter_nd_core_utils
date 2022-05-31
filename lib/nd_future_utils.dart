//
// nd_future_utils.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Sun May 29 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:tuple/tuple.dart';

extension NDFutureUtils<T> on Future<T> {
  Future<Tuple2<T, T1>> join<T1>(Future<T1> other) {
    return Future.wait([this, other]).then((value) => Tuple2.fromList(value));
  }

  Future<Tuple2<T, T1>> ndJoin<T1>(Future<T1> other) => join(other);

  Future<Tuple3<T, T1, T2>> join2<T1, T2>(
    Future<T1> other1,
    Future<T2> other2,
  ) {
    return Future.wait([this, other1, other2])
        .then((value) => Tuple3.fromList(value));
  }

  Future<Tuple3<T, T1, T2>> ndJoin2<T1, T2>(
    Future<T1> other1,
    Future<T2> other2,
  ) =>
      join2(other1, other2);

  Future<Tuple4<T, T1, T2, T3>> join3<T1, T2, T3>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
  ) {
    return Future.wait([this, other1, other2, other3])
        .then((value) => Tuple4.fromList(value));
  }

  Future<Tuple4<T, T1, T2, T3>> ndJoin3<T1, T2, T3>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
  ) =>
      join3(other1, other2, other3);

  Future<Tuple5<T, T1, T2, T3, T4>> join4<T1, T2, T3, T4>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
  ) {
    return Future.wait([this, other1, other2, other3, other4])
        .then((value) => Tuple5.fromList(value));
  }

  Future<Tuple5<T, T1, T2, T3, T4>> ndJoin4<T1, T2, T3, T4>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
  ) =>
      join4(other1, other2, other3, other4);

  Future<Tuple6<T, T1, T2, T3, T4, T5>> join5<T1, T2, T3, T4, T5>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
    Future<T5> other5,
  ) {
    return Future.wait([this, other1, other2, other3, other4, other5])
        .then((value) => Tuple6.fromList(value));
  }

  Future<Tuple6<T, T1, T2, T3, T4, T5>> ndJoin5<T1, T2, T3, T4, T5>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
    Future<T5> other5,
  ) =>
      join5(other1, other2, other3, other4, other5);

  Future<Tuple7<T, T1, T2, T3, T4, T5, T6>> join6<T1, T2, T3, T4, T5, T6>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
    Future<T5> other5,
    Future<T6> other6,
  ) {
    return Future.wait([this, other1, other2, other3, other4, other5, other6])
        .then((value) => Tuple7.fromList(value));
  }

  Future<Tuple7<T, T1, T2, T3, T4, T5, T6>> ndJoin6<T1, T2, T3, T4, T5, T6>(
    Future<T1> other1,
    Future<T2> other2,
    Future<T3> other3,
    Future<T4> other4,
    Future<T5> other5,
    Future<T6> other6,
  ) =>
      join6(other1, other2, other3, other4, other5, other6);
}
