import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/user.dart';

class FriendApi{
  static createFollow(int following){
    return HttpManager.getInstance().post("/api/friend/create", {"following":following});
  }

  static destroyFollow(int following){
    return HttpManager.getInstance().post("/api/friend/destroy", {"following":following});
  }
  
  static getFollower(User user){
    return HttpManager.getInstance().post("/api/friend/follower", JsonMapper.toMap(user,SerializationOptions(ignoreNullMembers: true)));
  }

  static getFollowing(User user){
    return HttpManager.getInstance().post("/api/friend/following", JsonMapper.toMap(user,SerializationOptions(ignoreNullMembers: true)));
  }
}