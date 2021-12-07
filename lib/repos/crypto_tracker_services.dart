import 'dart:io';

import 'package:crypto_tracker/utils/constants.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:dio/dio.dart';

import 'crypto_tracker_service_helper.dart';
import 'models/base_model.dart';
import 'resource.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> rawData);
typedef FromArrayJson<T> = List<T> Function(List<dynamic> rawData);

abstract class CryptoTrackerServices {
  init();

  Future<Resource<T>> requestGet<T extends BaseModel>(String serviceName,
      {Map<String, dynamic>? queryParams});

  Future<Resource<List<T>>> requestGetWithArrayResponses<T>(String serviceName,
      {Map<String, dynamic> queryParams});
}

class CryptoTrackerServicesImpl implements CryptoTrackerServices {
  static final CryptoTrackerServicesImpl _singleton = CryptoTrackerServicesImpl._internal();
  static final Dio _dio = Dio();
  static bool _isCreated = false;

  // ALERT: Just for demo purpose
  // Does not do it in production product :(
  static const String _apiKey = "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c";

  factory CryptoTrackerServicesImpl() {
    return _singleton;
  }

  CryptoTrackerServicesImpl._internal();

  @override
  init() async {
    if (!_isCreated) {
      _dio.options.baseUrl = Constants.urlBase;
      _dio.options.connectTimeout = Constants.connectionTimeout;
      _dio.options.receiveTimeout = Constants.connectionTimeout;
      _dio.interceptors.add(LogInterceptor(
        request: false,
        requestHeader: false,
        responseHeader: false,
        responseBody: true,
      ));
    }
    _isCreated = true;
    _dio.options.headers = await _buildHeader();
  }

  Map<String, dynamic> _normalizeResponse(response) {
    return (response is String) ? {} : response;
  }

  Future<Map<String, String>> _buildHeader() async {
    var header = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      "X-CMC_PRO_API_KEY": _apiKey,
    };
    return header;
  }

  @override
  Future<Resource<T>> requestGet<T extends BaseModel>(String serviceName,
      {Map<String, dynamic>? queryParams}) async {
    Map<String, dynamic> rawData;
    try {
      var response = await _dio.get(prepareRequestUrl(serviceName), queryParameters: queryParams);
      rawData = _normalizeResponse(response.data);
      return CryptoTrackerServiceHelper.convert<T>(rawData);
    } on DioError catch (error) {
      return Resource<T>.fail(error.message);
    }
  }

  @override
  Future<Resource<List<T>>> requestGetWithArrayResponses<T>(String serviceName,
      {Map<String, dynamic>? queryParams}) async {
    List<dynamic> rawData;
    try {
      var response = await _dio.get(prepareRequestUrl(serviceName), queryParameters: queryParams);
      rawData = response.data;
      return CryptoTrackerServiceHelper.convertToArray<T>(rawData);
    } on DioError catch (error) {
      return Resource<List<T>>.fail(error.message);
    }
  }
}
