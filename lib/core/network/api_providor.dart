// ignore_for_file: unused_catch_clause

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_app/core/errors/exceptions.dart';
import 'package:to_do_app/core/network/api_request.dart';
import 'package:to_do_app/core/utils/storage/app_storage.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 30);
  final _client = Dio(BaseOptions(connectTimeout: requestTimeOut));
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request({required APIRequest request, required bool unit}) async {
    try {
      final response = await _client.request(
        AppEndPoints.baseUrl + request.endPoint,
        options: Options(
          headers: request.headers,
          method: request.method.string,
        ),
        queryParameters: request.query,
        data: request.body,
      );
      log(response.toString());
      log(response.statusCode.toString());
      return _returnResponse(response: response, isUnit: unit);
    } on DioException catch (e) {
      if (e.type.toString() == 'DioExceptionType.connectionTimeout') {
        throw TimeOutException();
      }
      if (e.type.toString() == 'DioExceptionType.connectionError') {
        throw NetworkException();
      }

      if (e.response != null) {
        _returnResponse(response: e.response!, isUnit: unit);
      }
    } on Exception catch (e) {
      throw ServerException();
    }
  }

  dynamic _returnResponse(
      {required Response<dynamic> response, required bool isUnit}) {
    log(response.toString());
    log(response.statusCode.toString());

    switch (response.statusCode) {
      case 200:
        return isUnit ? Future.value(unit) : response.data;
      case 400:
        throw InvalidCredentialsException();
      case 500:
        throw ServerException();
      default:
        throw ServerException();
    }
  }
}

///
void printWarningLong(String text) {
  print('\x1B[33m////////////////////////////////////////////////\x1B[0m');
  log(text);

  print('\x1B[37m' '\x1B[0m');
  print('\x1B[33m/////////////////////////////////////////////////\x1B[0m');
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
  print('\x1B[37m' '\x1B[0m');
}

void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
  print('\x1B[37m' '\x1B[0m');
}

void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
  print('\x1B[37m' '\x1B[0m');
}
