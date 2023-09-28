import 'dart:convert';

class BaseResponse<T> {
  int? status;
  String? message;
  T? data;

  BaseResponse({this.status, this.message, this.data});

  factory BaseResponse.fromMap(Map<String, dynamic> data,
          {T Function(dynamic data)? convert}) =>
      BaseResponse(
        status: data['status'] as int?,
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : convert == null
                ? null
                : convert(data['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseResponse].
  factory BaseResponse.fromJson(String data,
      {T Function(dynamic data)? convert}) {
    return BaseResponse.fromMap(json.decode(data), convert: convert);
  }

  /// `dart:convert`
  ///
  /// Converts [BaseResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  BaseResponse<T> copyWith({
    int? status,
    String? message,
    T? data,
  }) {
    return BaseResponse<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
