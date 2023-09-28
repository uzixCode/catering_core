import 'dart:convert';

class OrderanRes {
  int? id;
  String? kode;
  String? kodeUser;
  String? nama;
  String? notelp;
  String? lat;
  String? lng;
  String? metodePembayaran;
  String? buktiPembayaran;
  String? catatan;
  String? alamat;
  int? total;
  int? tipe;
  int? ongkir;
  int? status;
  String? pengambilan;
  String? createdAt;
  String? updateAt;
  bool? isPaid;

  OrderanRes(
      {this.id,
      this.kode,
      this.kodeUser,
      this.nama,
      this.notelp,
      this.lat,
      this.lng,
      this.metodePembayaran,
      this.buktiPembayaran,
      this.catatan,
      this.alamat,
      this.total,
      this.tipe,
      this.ongkir,
      this.status,
      this.pengambilan,
      this.createdAt,
      this.updateAt,
      this.isPaid});

  factory OrderanRes.fromMap(Map<String, dynamic> data) => OrderanRes(
        id: data['id'] as int?,
        kode: data['kode'] as String?,
        kodeUser: data['kodeUser'] as String?,
        nama: data['nama'] as String?,
        notelp: data['notelp'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        metodePembayaran: data['metodePembayaran'] as String?,
        buktiPembayaran: data['buktiPembayaran'] as String?,
        catatan: data['catatan'] as String?,
        alamat: data['alamat'] as String?,
        total: data['total'] as int?,
        tipe: data['tipe'] as int?,
        ongkir: data['ongkir'] as int?,
        status: data['status'] as int?,
        pengambilan: data['pengambilan'] as String?,
        createdAt: data['createdAt'] as String?,
        updateAt: data['updateAt'] as String?,
        isPaid: data['isPaid'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'kode': kode,
        'kodeUser': kodeUser,
        'nama': nama,
        'notelp': notelp,
        'lat': lat,
        'lng': lng,
        'metodePembayaran': metodePembayaran,
        'buktiPembayaran': buktiPembayaran,
        'catatan': catatan,
        'alamat': alamat,
        'total': total,
        'tipe': tipe,
        'ongkir': ongkir,
        'status': status,
        'pengambilan': pengambilan,
        'createdAt': createdAt,
        'updateAt': updateAt,
        'isPaid': isPaid
      }..removeWhere((key, value) => value == null);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderanRes].
  factory OrderanRes.fromJson(String data) {
    return OrderanRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderanRes] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderanRes copyWith(
      {int? id,
      String? kode,
      String? kodeUser,
      String? nama,
      String? notelp,
      String? lat,
      String? lng,
      String? metodePembayaran,
      String? buktiPembayaran,
      String? catatan,
      String? alamat,
      int? total,
      int? tipe,
      int? ongkir,
      int? status,
      String? pengambilan,
      String? createdAt,
      String? updateAt,
      bool? isPaid}) {
    return OrderanRes(
        id: id ?? this.id,
        kode: kode ?? this.kode,
        kodeUser: kodeUser ?? this.kodeUser,
        nama: nama ?? this.nama,
        notelp: notelp ?? this.notelp,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        metodePembayaran: metodePembayaran ?? this.metodePembayaran,
        buktiPembayaran: buktiPembayaran ?? this.buktiPembayaran,
        catatan: catatan ?? this.catatan,
        alamat: alamat ?? this.alamat,
        total: total ?? this.total,
        tipe: tipe ?? this.tipe,
        ongkir: ongkir ?? this.ongkir,
        status: status ?? this.status,
        pengambilan: pengambilan ?? this.pengambilan,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        isPaid: isPaid ?? this.isPaid);
  }
}
