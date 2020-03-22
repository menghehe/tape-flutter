
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Address.dart';
import 'Interceptors.dart';

class HttpManager{
  static HttpManager _instance = HttpManager._internal();

  Dio _dio;

  factory HttpManager() => _instance;

  HttpManager._internal({String baseUrl}){
    if(null==_dio){
      _dio = new Dio(new BaseOptions(
        baseUrl: "",
        connectTimeout: 15000
      ));
      _dio.interceptors.add(new LogsInterceptors());
      _dio.interceptors.add(new ResponseInterceptors());
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
//      return resultError(e);
    }

    if (response.data is DioError) {
//      return resultError(response.data['code']);
    }

    return response.data;
  }
  ///通用的POST请求
  post(url, params, {noTip = false}) async {
    Response response;

    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
//      return resultError(e);
    }

    if (response.data is DioError) {
      Fluttertoast.showToast(msg: "出错了");
//      return resultError(response.data['code']);
    }

    if (response == null) {
      Fluttertoast.showToast(msg: "出错了");
//      return resultError(response.data['code']);
    }

    return response.data;
  }

}
