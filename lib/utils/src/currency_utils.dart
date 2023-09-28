import 'package:catering_core/core.dart';

extension CurrencyUtils on int? {
  String toCurrency() {
    if (this == null) return "0";
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}

extension CurrencyUtilsNotNull on int {
  String toCurrency() {
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}
