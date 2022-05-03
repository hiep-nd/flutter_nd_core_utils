//
// nd_disposable_wrapper.dart
// nd_core_utils
//
// Created by Nguyen Duc Hiep on Tue May 03 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:nd_core_utils/nd_auto_disposable.dart';
import 'package:nd_core_utils/nd_disposable.dart';

@Deprecated('Use NDAutoDisposable instead. Will be removed in 1.1')
typedef NDDisposableWrapper<T extends NDDisposable> = NDAutoDisposable<T>;
