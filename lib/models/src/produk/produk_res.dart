import 'dart:convert';

class ProdukRes {
  int? id;
  String? kode;
  String? nama;
  String? deskripsi;
  String? foto;
  int? harga;
  int? estimasi;
  int? status;
  String? createdAt;
  String? updateAt;
  bool? recomend;
  String? kategori;

  ProdukRes(
      {this.id,
      this.kode,
      this.nama,
      this.deskripsi,
      this.foto,
      this.harga,
      this.estimasi,
      this.status,
      this.createdAt,
      this.updateAt,
      this.recomend,
      this.kategori});

  factory ProdukRes.fromMap(Map<String, dynamic> data) => ProdukRes(
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        nama: data['nama'] as String?,
        deskripsi: data['deskripsi'] as String?,
        foto: data['foto'] as String?,
        harga: data['harga'] as int?,
        estimasi: data['estimasi'] as int?,
        status: data['status'] as int?,
        createdAt: data['createdAt'] as String?,
        updateAt: data['updateAt'] as String?,
        kategori: data['kategori'] as String?,
        recomend: data['recomend'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'nama': nama,
        'deskripsi': deskripsi,
        'foto': foto,
        'harga': harga,
        'estimasi': estimasi,
        'status': status,
        'createdAt': createdAt,
        'updateAt': updateAt,
        'recomend': recomend,
        'kategori': kategori
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProdukRes].
  factory ProdukRes.fromJson(String data) {
    return ProdukRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProdukRes] to a JSON string.
  String toJson() => json.encode(toMap());

  ProdukRes copyWith({
    int? id,
    String? kode,
    String? nama,
    String? deskripsi,
    String? foto,
    int? harga,
    int? estimasi,
    int? status,
    String? createdAt,
    String? updateAt,
  }) {
    return ProdukRes(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      foto: foto ?? this.foto,
      harga: harga ?? this.harga,
      estimasi: estimasi ?? this.estimasi,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
