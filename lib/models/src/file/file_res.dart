import 'dart:convert';

import '../../../core.dart';

class FileRes {
  String? createdAt;
  int? id;
  String? kode;
  String? nama;
  String? owner;
  String? path;
  String? type;
  String? updateAt;
  FilePickerResult? data;

  FileRes(
      {this.createdAt,
      this.id,
      this.kode,
      this.nama,
      this.owner,
      this.path,
      this.type,
      this.updateAt,
      this.data});

  factory FileRes.fromMap(Map<String, dynamic> data) => FileRes(
        createdAt: data['createdAt'] as String?,
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        nama: data['nama'] as String?,
        owner: data['owner'] as String?,
        path: data['path'] as String?,
        type: data['type'] as String?,
        updateAt: data['updateAt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt,
        'id': id,
        'kode': kode,
        'nama': nama,
        'owner': owner,
        'path': path,
        'type': type,
        'updateAt': updateAt,
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FileRes].
  factory FileRes.fromJson(String data) {
    return FileRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FileRes] to a JSON string.
  String toJson() => json.encode(toMap());

  FileRes copyWith({
    String? createdAt,
    int? id,
    String? kode,
    String? nama,
    String? owner,
    String? path,
    String? type,
    String? updateAt,
  }) {
    return FileRes(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      owner: owner ?? this.owner,
      path: path ?? this.path,
      type: type ?? this.type,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
