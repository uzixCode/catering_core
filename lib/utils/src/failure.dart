import 'package:catering_core/core.dart';

class Failure<T> {
  BaseResponse<T> response;
  Failure({
    required this.response,
  });
}
