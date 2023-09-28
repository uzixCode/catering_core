// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:catering_core/core.dart';

enum Methods { GET, POST, PUT, DELETE }

class Htreq {
  void Function()? onExpiredToken;
  BaseOptions base = BaseOptions(
    validateStatus: (status) => true,
    receiveDataWhenStatusError: true,
  );
  void setBaseUrl(String url) {
    base.baseUrl = url;
  }

  void setOnExpiredToken(void Function()? _) {
    onExpiredToken = _;
  }

  void setToken([String? token]) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final tok = pref.getString("token");
    log("Token: $tok");
    base.headers["Authorization"] = token ?? tok;
  }

  Future<Either<Failure, Response<T>>> req<T>(String path,
      {Methods methods = Methods.POST,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) async {
    final dio = Dio(base);

    try {
      final Response<T> response;
      switch (methods) {
        case Methods.GET:
          response = await dio.get(path,
              data: data,
              queryParameters: queryParameters,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
              options: options);
          break;
        case Methods.POST:
          response = await dio.post<T>(path,
              data: data,
              queryParameters: queryParameters,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
              options: options);
          break;
        case Methods.PUT:
          response = await dio.put(path,
              data: data,
              queryParameters: queryParameters,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
              options: options);
          break;
        case Methods.DELETE:
          response = await dio.delete(path,
              data: data,
              queryParameters: queryParameters,
              cancelToken: cancelToken,
              options: options);
          break;
      }
      log("Request----------------------------");
      log("[ ${response.statusCode} ] $path");
      log(data.toString());
      if (response.statusCode == 417) {
        setToken();
        onExpiredToken == null
            ? log("[ 417 ] Token is Expired")
            : onExpiredToken!();
      }
      if (response.statusCode != 200) {
        throw HttpException(response: response);
      }
      log("Response----------------------------");
      log(response.data.toString());
      return Right(response);
    } on HttpException catch (e) {
      return Left(Failure(
          response: BaseResponse(
              status: e.response.statusCode,
              message: "Terjadi kesalahan",
              data: e.response)));
    } catch (e) {
      log(e.toString());
      return Left(Failure(
          response: BaseResponse(status: 1001, message: "Terjadi kesalahan")));
    }
  }
}
