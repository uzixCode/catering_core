import 'dart:convert';

import '../produk/produk_res.dart';

class OrderanItemRes {
  int? id;
  String? kode;
  String? kodeOrderan;
  String? kodeProduk;
  String? catatan;
  int? total;
  String? createdAt;
  String? updateAt;
  ProdukRes? produk;
  OrderanItemRes(
      {this.id,
      this.kode,
      this.kodeOrderan,
      this.kodeProduk,
      this.catatan,
      this.total,
      this.createdAt,
      this.updateAt,
      this.produk});

  factory OrderanItemRes.fromMap(Map<String, dynamic> data) => OrderanItemRes(
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        kodeOrderan: data['kodeOrderan'] as String?,
        kodeProduk: data['kodeProduk'] as String?,
        catatan: data['catatan'] as String?,
        total: data['total'] as int?,
        createdAt: data['createdAt'] as String?,
        updateAt: data['updateAt'] as String?,
        produk: data['produk'] == null
            ? null
            : ProdukRes.fromMap(data['produk'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'kodeOrderan': kodeOrderan,
        'kodeProduk': kodeProduk,
        'catatan': catatan,
        'total': total,
        'createdAt': createdAt,
        'updateAt': updateAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderanItemRes].
  factory OrderanItemRes.fromJson(String data) {
    return OrderanItemRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderanItemRes] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderanItemRes copyWith({
    int? id,
    String? kode,
    String? kodeOrderan,
    String? kodeProduk,
    String? catatan,
    int? total,
    String? createdAt,
    String? updateAt,
  }) {
    return OrderanItemRes(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      kodeOrderan: kodeOrderan ?? this.kodeOrderan,
      kodeProduk: kodeProduk ?? this.kodeProduk,
      catatan: catatan ?? this.catatan,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
