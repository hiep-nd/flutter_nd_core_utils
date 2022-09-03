//
//  nd_core_utils_object_test.dart
//  nd_core_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

void main() {
  test('Test NDJsonUtils test', () async {
    final dynamic json = jsonDecode(
        await File('test/assets/nd_json_utils_test.json').readAsString());

    expect(
      cast<NDJsArray>(json)
          ?.getOrNullAt<NDJsObject>(0)
          ?.getAt<NDJsObject>('yoast_head_json')
          ?.getAt<NDJsArray>('og_image')
          ?.getOrNullAt<NDJsObject>(0)
          ?.getAt<String>('url'),
      "http://kss.com.vn/wp-content/uploads/2022/08/lai-suat-ngan-hang-standard-chartered-2022040609102618.png",
    );
  });
}
