import 'dart:convert';

import 'package:catering_core/models/src/produk/produk_res.dart';

class KeranjangRes {
  String? catatan;
  String? createdAt;
  int? id;
  String? kode;
  String? kodeProduk;
  String? kodeUser;
  ProdukRes? produk;
  int? total;
  String? updateAt;

  KeranjangRes({
    this.catatan,
    this.createdAt,
    this.id,
    this.kode,
    this.kodeProduk,
    this.kodeUser,
    this.produk,
    this.total,
    this.updateAt,
  });

  factory KeranjangRes.fromMap(Map<String, dynamic> data) => KeranjangRes(
        catatan: data['catatan'] as String?,
        createdAt: data['createdAt'] as String?,
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        kodeProduk: data['kodeProduk'] as String?,
        kodeUser: data['kodeUser'] as String?,
        produk: data['produk'] == null
            ? null
            : ProdukRes.fromMap(data['produk'] as Map<String, dynamic>),
        total: data['total'] as int?,
        updateAt: data['updateAt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'catatan': catatan,
        'createdAt': createdAt,
        'id': id,
        'kode': kode,
        'kodeProduk': kodeProduk,
        'kodeUser': kodeUser,
        'produk': produk?.toMap(),
        'total': total,
        'updateAt': updateAt,
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KeranjangRes].
  factory KeranjangRes.fromJson(String data) {
    return KeranjangRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeranjangRes] to a JSON string.
  String toJson() => json.encode(toMap());

  KeranjangRes copyWith({
    String? catatan,
    String? createdAt,
    int? id,
    String? kode,
    String? kodeProduk,
    String? kodeUser,
    ProdukRes? produk,
    int? total,
    String? updateAt,
  }) {
    return KeranjangRes(
      catatan: catatan ?? this.catatan,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      kode: kode ?? this.kode,
      kodeProduk: kodeProduk ?? this.kodeProduk,
      kodeUser: kodeUser ?? this.kodeUser,
      produk: produk ?? this.produk,
      total: total ?? this.total,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
