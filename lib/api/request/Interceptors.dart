import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tape/api/request/ResultData.dart';

class ResponseInterceptors extends InterceptorsWrapper  {

  @override
  onResponse(Response response) async {
    var res = response.data;
    if(res["code"]!=1){
      Fluttertoast.showToast(msg: res["message"]);
      return new ResultData(res["data"], false, res["code"], res["message"]);
    }else{
      return new ResultData(res["data"], true, res["code"], res["message"]);
    }

  }
}

class RequestInterceptors extends InterceptorsWrapper{

  @override
  // ignore: missing_return
  Future onRequest(RequestOptions options) {
  }
}

class LogsInterceptors extends InterceptorsWrapper  {

  @override
  Future onRequest(RequestOptions options) async {
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var header ={"Authorization":token};
    options.headers.addAll(header);
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    Fluttertoast.showToast(msg: "出错了");
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    if (response != null) {
      var responseStr = response.toString();
      print("请求结果:"+responseStr);
    }
    return super.onResponse(response); //
  }
}
