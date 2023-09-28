import 'dart:convert';

import 'package:catering_core/core.dart';
import 'package:catering_core/models/src/produk/produk_res.dart';
import 'package:dio/dio.dart';

import '../models/src/orderanItem/orederan_item.dart';

class Repositories {
  static Future<Either<Failure, BaseResponse<UserRes>>> login(
      UserRes data) async {
    final response =
        await locator<Htreq>().req<String>(Endpoints.login, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<UserRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: UserRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

//<PRODUK>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<ProdukRes>>> addProduk(
      ProdukRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.produk, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<ProdukRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: ProdukRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<ProdukRes>>>> getAllProduk(
      dynamic data) async {
    final response = await locator<Htreq>().req<String>(
      Endpoints.produk,
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<ProdukRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<ProdukRes>.from(
              json.decode(r.data ?? "[]").map((x) => ProdukRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<ProdukRes>>>>
      getAllRecomendProduk(dynamic data) async {
    final response = await locator<Htreq>().req<String>(
      "${Endpoints.produk}/recomend",
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<ProdukRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<ProdukRes>.from(
              json.decode(r.data ?? "[]").map((x) => ProdukRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<ProdukRes>>>>
      postSearchProduk(String data) async {
    final response = await locator<Htreq>()
        .req<String>("${Endpoints.produk}/search", data: {"keyword": data});
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<ProdukRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<ProdukRes>.from(
              json.decode(r.data ?? "[]").map((x) => ProdukRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<ProdukRes>>> getSingleProduk(
      ProdukRes data) async {
    final response = await locator<Htreq>()
        .req<String>("${Endpoints.produk}/${data.kode}", methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<ProdukRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: ProdukRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<ProdukRes>>> updateProduk(
      ProdukRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.produk}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<ProdukRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: ProdukRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<ProdukRes>>> deleteProduk(
      ProdukRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.produk}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<ProdukRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: ProdukRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }
  //<FILE>---------------------------------------------------------------------------

  static Future<Either<Failure, BaseResponse<List<FileRes>>>> getFiles(
      FileRes data) async {
    final response = await locator<Htreq>().req<String>(
        dataBuilder<String>(() {
          if (data.owner != null) {
            return "${Endpoints.file}/user/${data.owner}";
          }
          return Endpoints.file;
        })!,
        methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<FileRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<FileRes>.from(
              json.decode(r.data ?? "[]").map((x) => FileRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<FileRes>>> uploadFiles(
      FileRes data) async {
    final file = await MultipartFile.fromFile(
      data.data?.files.single.path ?? "",
      filename: data.data?.files.single.name,
    );
    FormData formData = FormData.fromMap({
      'file': file,
      'nama': data.data?.files.single.name,
      'type': data.data?.files.single.extension,
      'owner': data.owner
    }..removeWhere((key, value) => value == null));
    final response =
        await locator<Htreq>().req<String>(Endpoints.file, data: formData);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<FileRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: FileRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<dynamic>>> deleteFiles(
      DeleteFileReq data) async {
    final response = await locator<Htreq>().req<String>(Endpoints.file,
        data: data.toMap(), methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<dynamic>(
          status: r.statusCode,
          message: r.statusMessage,
          data: null,
        ),
      ),
    );
  }

  //<USER>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<UserRes>>> addUser(
      UserRes data) async {
    final response =
        await locator<Htreq>().req<String>(Endpoints.user, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<UserRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: UserRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<UserRes>>> getSingleUser(
      UserRes data) async {
    final response = await locator<Htreq>()
        .req<String>("${Endpoints.user}/${data.kode}", methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<UserRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: UserRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<UserRes>>> updateUser(
      UserRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.user}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<UserRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: UserRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  //<KERANJANG>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<KeranjangRes>>> addKeranjang(
      KeranjangRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.keranjang, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<KeranjangRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: KeranjangRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<KeranjangRes>>>>
      getAllKeranjangByUser(String data) async {
    final response = await locator<Htreq>().req<String>(
      "${Endpoints.keranjang}/user/$data",
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<KeranjangRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<KeranjangRes>.from(
              json.decode(r.data ?? "[]").map((x) => KeranjangRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<KeranjangRes>>> getSingleKeranjang(
      KeranjangRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.keranjang}/${data.kode}",
        methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<KeranjangRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: KeranjangRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<KeranjangRes>>> updateKeranjang(
      KeranjangRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.keranjang}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<KeranjangRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: KeranjangRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<KeranjangRes>>> deleteKeranjang(
      KeranjangRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.keranjang}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<KeranjangRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: KeranjangRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  //<ALAMAT>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<AlamatRes>>> addAlamat(
      AlamatRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.alamat, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<AlamatRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: AlamatRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<AlamatRes>>>>
      getAllAlamatByUser(String data) async {
    final response = await locator<Htreq>().req<String>(
      "${Endpoints.alamat}/user/$data",
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<AlamatRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<AlamatRes>.from(
              json.decode(r.data ?? "[]").map((x) => AlamatRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<AlamatRes>>> getSingleAlamat(
      AlamatRes data) async {
    final response = await locator<Htreq>()
        .req<String>("${Endpoints.alamat}/${data.kode}", methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<AlamatRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: AlamatRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<AlamatRes>>> updateAlamat(
      AlamatRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.alamat}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<AlamatRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: AlamatRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<AlamatRes>>> deleteAlamat(
      AlamatRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.alamat}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<AlamatRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: AlamatRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  //<METODE PEMBAYARAN>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<MetodePembayaranRes>>>
      addMetodePembayaran(MetodePembayaranRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.metodePembayaran, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<MetodePembayaranRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: MetodePembayaranRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<MetodePembayaranRes>>>>
      getAllMetodePembayaran(String data) async {
    final response = await locator<Htreq>().req<String>(
      Endpoints.metodePembayaran,
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<MetodePembayaranRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<MetodePembayaranRes>.from(json
              .decode(r.data ?? "[]")
              .map((x) => MetodePembayaranRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<MetodePembayaranRes>>>
      getSingleMetodePembayaran(MetodePembayaranRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.metodePembayaran}/${data.kode}",
        methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<MetodePembayaranRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: MetodePembayaranRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<MetodePembayaranRes>>>
      updateMetodePembayaran(MetodePembayaranRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.metodePembayaran}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<MetodePembayaranRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: MetodePembayaranRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<MetodePembayaranRes>>>
      deleteMetodePembayaran(MetodePembayaranRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.metodePembayaran}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<MetodePembayaranRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: MetodePembayaranRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  //<ORDERAN>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<OrderanRes>>> addOrderan(
      OrderanRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.orderan, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<OrderanRes>>>>
      getAllOrderanByUser(String data) async {
    final response = await locator<Htreq>().req<String>(
      "${Endpoints.orderan}/user/$data",
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<OrderanRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<OrderanRes>.from(
              json.decode(r.data ?? "[]").map((x) => OrderanRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<OrderanRes>>>> getAllOrderan(
      String data) async {
    final response = await locator<Htreq>().req<String>(
      Endpoints.orderan,
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<OrderanRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<OrderanRes>.from(
              json.decode(r.data ?? "[]").map((x) => OrderanRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanRes>>> getSingleOrderan(
      OrderanRes data) async {
    final response = await locator<Htreq>()
        .req<String>("${Endpoints.orderan}/${data.kode}", methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanRes>>> updateOrderan(
      OrderanRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.orderan}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanRes>>> deleteOrderan(
      OrderanRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.orderan}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  //<ORDERANITEM>---------------------------------------------------------------------------
  static Future<Either<Failure, BaseResponse<OrderanItemRes>>> addOrderanItem(
      OrderanItemRes data) async {
    final response = await locator<Htreq>()
        .req<String>(Endpoints.orderanItems, data: data.toMap());
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanItemRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanItemRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<List<OrderanItemRes>>>>
      getAllOrderanItemByOrder(String data) async {
    final response = await locator<Htreq>().req<String>(
      "${Endpoints.orderanItems}/order/$data",
      methods: Methods.GET,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<List<OrderanItemRes>>(
          status: r.statusCode,
          message: r.statusMessage,
          data: List<OrderanItemRes>.from(json
              .decode(r.data ?? "[]")
              .map((x) => OrderanItemRes.fromMap(x))),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanItemRes>>>
      getSingleOrderanItem(OrderanItemRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.orderanItems}/${data.kode}",
        methods: Methods.GET);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanItemRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanItemRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanItemRes>>>
      updateOrderanItem(OrderanItemRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.orderanItems}/${data.kode}",
        data: data.toMap(),
        methods: Methods.PUT);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanItemRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanItemRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }

  static Future<Either<Failure, BaseResponse<OrderanItemRes>>>
      deleteOrderanItem(OrderanItemRes data) async {
    final response = await locator<Htreq>().req<String>(
        "${Endpoints.orderanItems}/${data.kode}",
        data: data.toMap(),
        methods: Methods.DELETE);
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        BaseResponse<OrderanItemRes>(
          status: r.statusCode,
          message: r.statusMessage,
          data: OrderanItemRes.fromJson(r.data ?? "{}"),
        ),
      ),
    );
  }
}
