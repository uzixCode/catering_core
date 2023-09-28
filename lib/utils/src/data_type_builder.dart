int? intBuilder(int? Function() builder) => builder();
double? doubleBuilder(double? Function() builder) => builder();
String? stringBuilder(String? Function() builder) => builder();
T? dataBuilder<T>(T? Function() builder) => builder();
