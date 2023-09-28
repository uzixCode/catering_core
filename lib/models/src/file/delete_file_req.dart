import 'dart:convert';

class DeleteFileReq {
  List<String>? files;

  DeleteFileReq({this.files});

  factory DeleteFileReq.fromMap(Map<String, dynamic> data) => DeleteFileReq(
        files: data['files'] as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'files': files,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeleteFileReq].
  factory DeleteFileReq.fromJson(String data) {
    return DeleteFileReq.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeleteFileReq] to a JSON string.
  String toJson() => json.encode(toMap());

  DeleteFileReq copyWith({
    List<String>? files,
  }) {
    return DeleteFileReq(
      files: files ?? this.files,
    );
  }
}
