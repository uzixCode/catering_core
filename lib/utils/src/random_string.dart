import 'package:random_string/random_string.dart';

extension RandomingString on int? {
  String randomString(int length) {
    switch (this) {
      case 0:
        return randomNumeric(length);
      case 1:
        return randomAlpha(length);
      case 2:
        return randomAlphaNumeric(length);
      default:
        return "-";
    }
  }
}
