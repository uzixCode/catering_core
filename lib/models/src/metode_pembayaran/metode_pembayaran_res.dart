import 'dart:convert';

class MetodePembayaranRes {
  int? id;
  String? kode;
  String? nama;
  String? atasNama;
  String? noRek;
  String? image;
  String? createdAt;
  String? updateAt;

  MetodePembayaranRes({
    this.id,
    this.kode,
    this.nama,
    this.atasNama,
    this.noRek,
    this.image,
    this.createdAt,
    this.updateAt,
  });

  factory MetodePembayaranRes.fromMap(Map<String, dynamic> data) {
    return MetodePembayaranRes(
      id: data['id'] as int?,
      kode: data['kode'] as String?,
      nama: data['nama'] as String?,
      atasNama: data['atasNama'] as String?,
      noRek: data['noRek'] as String?,
      image: data['image'] as String?,
      createdAt: data['createdAt'] as String?,
      updateAt: data['updateAt'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'nama': nama,
        'atasNama': atasNama,
        'noRek': noRek,
        'image': image,
        'createdAt': createdAt,
        'updateAt': updateAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MetodePembayaranRes].
  factory MetodePembayaranRes.fromJson(String data) {
    return MetodePembayaranRes.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MetodePembayaranRes] to a JSON string.
  String toJson() => json.encode(toMap());

  MetodePembayaranRes copyWith({
    int? id,
    String? kode,
    String? nama,
    String? atasNama,
    String? noRek,
    String? image,
    String? createdAt,
    String? updateAt,
  }) {
    return MetodePembayaranRes(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      atasNama: atasNama ?? this.atasNama,
      noRek: noRek ?? this.noRek,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
