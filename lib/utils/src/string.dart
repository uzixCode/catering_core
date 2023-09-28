extension StringExt on String {
  String removeTrailingComma() {
    if (isNotEmpty && endsWith(',')) {
      return substring(0, length - 1);
    }
    return this;
  }
}
