import 'dart:convert';

class BaseRequest<T> {
  String? path;
  String? method;
  T? data;

  BaseRequest({this.path, this.method, this.data});

  factory BaseRequest.fromMap(Map<String, dynamic> data,
          T Function(Map<String, dynamic> data) convert) =>
      BaseRequest(
        path: data['path'] as String?,
        method: data['method'] as String?,
        data: data['data'] == null ? null : convert(data),
      );

  Map<String, dynamic> toMap() => {
        'path': path,
        'method': method,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseRequest].
  factory BaseRequest.fromJson(
      String data, T Function(Map<String, dynamic> data) convert) {
    return BaseRequest.fromMap(
        json.decode(data) as Map<String, dynamic>, convert);
  }

  /// `dart:convert`
  ///
  /// Converts [BaseRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  BaseRequest copyWith({
    String? path,
    String? method,
    T? data,
  }) {
    return BaseRequest(
      path: path ?? this.path,
      method: method ?? this.method,
      data: data ?? this.data,
    );
  }
}
