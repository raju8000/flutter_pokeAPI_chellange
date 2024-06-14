import 'dart:developer' as devtools show log;

import 'package:flutter/foundation.dart';

extension Log on Object {
  void log() {
    if(kDebugMode) {
      devtools.log(toString(),name: "LOGX");
    }
  }
}