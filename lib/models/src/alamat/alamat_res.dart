import 'dart:convert';

class AlamatRes {
  int? id;
  String? kode;
  String? kodeUser;
  String? nama;
  String? detail;
  String? lat;
  String? lng;
  String? createdAt;
  String? updateAt;

  AlamatRes({
    this.id,
    this.kode,
    this.kodeUser,
    this.nama,
    this.detail,
    this.lat,
    this.lng,
    this.createdAt,
    this.updateAt,
  });

  factory AlamatRes.fromMap(Map<String, dynamic> data) => AlamatRes(
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        kodeUser: data['kodeUser'] as String?,
        nama: data['nama'] as String?,
        detail: data['detail'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        createdAt: data['createdAt'] as String?,
        updateAt: data['updateAt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'kodeUser': kodeUser,
        'nama': nama,
        'detail': detail,
        'lat': lat,
        'lng': lng,
        'createdAt': createdAt,
        'updateAt': updateAt,
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AlamatRes].
  factory AlamatRes.fromJson(String data) {
    return AlamatRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AlamatRes] to a JSON string.
  String toJson() => json.encode(toMap());

  AlamatRes copyWith({
    int? id,
    String? kode,
    String? kodeUser,
    String? nama,
    String? detail,
    String? lat,
    String? lng,
    String? createdAt,
    String? updateAt,
  }) {
    return AlamatRes(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      kodeUser: kodeUser ?? this.kodeUser,
      nama: nama ?? this.nama,
      detail: detail ?? this.detail,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
