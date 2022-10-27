//
// nd_core_utils_date_time.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Thu Jun 23 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/src/nd_core_utils_object.dart';

extension NDCoreUtilsDateTime on DateTime {
  DateTime copyWith(
      {int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond,
      bool? isUtc}) {
    isUtc ??= this.isUtc;
    return isUtc
        ? DateTime.utc(
            year ?? this.year,
            month ?? this.month,
            day ?? this.day,
            hour ?? this.hour,
            minute ?? this.minute,
            second ?? this.second,
            millisecond ?? this.millisecond,
            microsecond ?? this.microsecond)
        : DateTime(
            year ?? this.year,
            month ?? this.month,
            day ?? this.day,
            hour ?? this.hour,
            minute ?? this.minute,
            second ?? this.second,
            millisecond ?? this.millisecond,
            microsecond ?? this.microsecond);
  }

  DateTime ndCopyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
    bool? isUtc,
  }) =>
      copyWith(
        year: year,
        month: month,
        day: day,
        hour: hour,
        minute: minute,
        second: second,
        millisecond: millisecond,
        microsecond: microsecond,
        isUtc: isUtc,
      );

  DateTime utcDate({Duration timeZoneOffset = const Duration(hours: 0)}) {
    return toUtc()
        .add(timeZoneOffset)
        .map((value) => DateTime.utc(value.year, value.month, value.day))
        .subtract(timeZoneOffset);
  }

  DateTime ndUtcDate({Duration timeZoneOffset = const Duration(hours: 0)}) =>
      utcDate(timeZoneOffset: timeZoneOffset);

  bool isAfterOrAtSameMomentAs(DateTime other) => !isBefore(other);

  bool ndIsAfterOrAtSameMomentAs(DateTime other) =>
      isAfterOrAtSameMomentAs(other);

  bool isBeforeOrAtSameMomentAs(DateTime other) => !isAfter(other);

  bool ndIsBeforeOrAtSameMomentAs(DateTime other) =>
      isBeforeOrAtSameMomentAs(other);
}
