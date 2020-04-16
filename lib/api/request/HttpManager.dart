import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tape/api/request/ResultData.dart';

import 'Address.dart';
import 'Interceptors.dart';

class HttpManager {
  //单例的HttpManager
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;
  factory HttpManager() => _instance;
  HttpManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = new Dio(new BaseOptions(baseUrl: "", connectTimeout: 3000));
      //请求拦截器
      _dio.interceptors.add(new RequestInterceptors());
      //结果拦截器
      _dio.interceptors.add(new ResponseInterceptors());
      //log拦截器
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名，比如cdn和kline首次的http请求
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != Address.BASE_API_URL) {
        _dio.options.baseUrl = Address.BASE_API_URL;
      }
    }
    return this;
  }

  ///通用的GET请求
  get(url, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      return ResultData(null, false, -10, e.message);
    }

    if (response.data is DioError) {
      return ResultData(null, false, -10, null);
    }

    return response.data;
  }

  ///通用的POST请求
  post(url, params, {noTip = false}) async {
    Response response;

    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      return ResultData(null, false, -10, null);
    }

    if (response.data is DioError) {
      return ResultData(null, false, -10, null);
    }

    if (response == null) {
      return ResultData(null, false, -10, null);
    }

    return response.data;
  }
}
