import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:security_test/constants/enums.dart';

class EnvKeys {
  static const Map<EnvKeyTypes, Map<int, String>> _keys = {
    EnvKeyTypes.env: {
      1: String.fromEnvironment("ENV_1"),
      2: String.fromEnvironment("ENV_2"),
      3: String.fromEnvironment("ENV_3"),
      4: String.fromEnvironment("ENV_4"),
      5: String.fromEnvironment("ENV_5"),
    },
    EnvKeyTypes.appName: {
      1: String.fromEnvironment("APP_NAME_1"),
      2: String.fromEnvironment("APP_NAME_2"),
      3: String.fromEnvironment("APP_NAME_3"),
      4: String.fromEnvironment("APP_NAME_4"),
      5: String.fromEnvironment("APP_NAME_5"),
    },
    EnvKeyTypes.appVersion: {
      1: String.fromEnvironment("APP_VERSION_1"),
      2: String.fromEnvironment("APP_VERSION_2"),
      3: String.fromEnvironment("APP_VERSION_3"),
      4: String.fromEnvironment("APP_VERSION_4"),
      5: String.fromEnvironment("APP_VERSION_5"),
    },
  };

  static String getKey(EnvKeyTypes keyType) {

    Uint8List base64DecodedKey = base64Decode([3, 1, 4].map((index) => _keys[keyType]![index]).join());
    String decodedKey = utf8.decode(base64DecodedKey);

    return decodedKey;
  }
}
