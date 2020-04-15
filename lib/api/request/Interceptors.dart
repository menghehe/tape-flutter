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

  @override
  Future onError(DioError err) {
    Fluttertoast.showToast(msg: err.message);
  }


}

class RequestInterceptors extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var header ={"Authorization":token};
    options.headers.addAll(header);
    return super.onRequest(options);
  }
}

