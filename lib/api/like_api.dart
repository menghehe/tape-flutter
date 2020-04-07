import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/like.dart';

class LikeApi{
  static createLike(Like like){
    return HttpManager.getInstance().post("/api/like/create", {"likeType":like.likeType,"targetId":like.targetId,"toId":like.toId});
  }

  static destroyLike(Like like){
    return HttpManager.getInstance().post("/api/like/destroy", {"likeType":like.likeType,"targetId":like.targetId,"toId":like.toId});
  }


}