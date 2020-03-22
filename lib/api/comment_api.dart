import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/comment.dart';

class CommentApi{
  static getComment(Comment comment){
    return HttpManager.getInstance().get("/api/comment/get", JsonMapper.toMap(comment,SerializationOptions(ignoreNullMembers: true)));
  }

  static postComment(Comment comment){
    return HttpManager.getInstance().post("/api/comment/add", JsonMapper.toMap(comment,SerializationOptions(ignoreNullMembers: true)));
  }
}