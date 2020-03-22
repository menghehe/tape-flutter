import 'package:tape/api/request/HttpManager.dart';

class UserApi{
  static login(String username,String password){
    var params = new Map<String,String>();
    params["username"] = username;
    params["password"] = password;
    return HttpManager.getInstance().post("/api/user/login", params);
  }
  static signUp(String username,String password){
    var params = new Map<String,String>();
    params["username"] = username;
    params["password"] = password;
    return HttpManager.getInstance().post("/api/user/register", params);
  }

  static getUserInfo(){
    return HttpManager.getInstance().get("/api/user/info",null);
  }

}