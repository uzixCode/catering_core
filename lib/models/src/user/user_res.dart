import 'dart:convert';

class UserRes {
  int? id;
  String? kode;
  String? email;
  String? password;
  String? nama;
  String? notelp;
  int? status;
  String? createdAt;
  String? updateAt;

  UserRes({
    this.id,
    this.kode,
    this.email,
    this.password,
    this.nama,
    this.notelp,
    this.status,
    this.createdAt,
    this.updateAt,
  });

  factory UserRes.fromMap(Map<String, dynamic> data) => UserRes(
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        nama: data['nama'] as String?,
        notelp: data['notelp'] as String?,
        status: data['status'] as int?,
        createdAt: data['createdAt'] as String?,
        updateAt: data['updateAt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'email': email,
        'password': password,
        'nama': nama,
        'notelp': notelp,
        'status': status,
        'createdAt': createdAt,
        'updateAt': updateAt,
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserRes].
  factory UserRes.fromJson(String data) {
    return UserRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserRes] to a JSON string.
  String toJson() => json.encode(toMap());

  UserRes copyWith({
    int? id,
    String? kode,
    String? email,
    String? password,
    String? nama,
    String? notelp,
    int? status,
    String? createdAt,
    String? updateAt,
  }) {
    return UserRes(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      email: email ?? this.email,
      password: password ?? this.password,
      nama: nama ?? this.nama,
      notelp: notelp ?? this.notelp,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
