import 'package:tape/api/request/HttpManager.dart';

class FriendApi{
  static createFollow(int following){
    return HttpManager.getInstance().post("/api/friend/create", {"following":following});
  }

  static destroyFollow(int following){
    return HttpManager.getInstance().post("/api/friend/destroy", {"following":following});
  }
}