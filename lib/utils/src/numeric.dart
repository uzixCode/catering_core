extension NummericExt on String? {
  bool hasMatch(value, String pattern) {
    return (this == null) ? false : RegExp(pattern).hasMatch(this!);
  }

  bool isNumericOnly(String? input) =>
      int.tryParse(input ?? this ?? "") != null;
  String numericOnly() {
    var numericOnlyStr = '';
    for (var i = 0; i < this!.length; i++) {
      if (isNumericOnly(this![i])) {
        numericOnlyStr += this![i];
      }
    }
    return numericOnlyStr;
  }
}
