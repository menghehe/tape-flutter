import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/user.dart';

@JsonSerializable()
class Comment extends Base{
  int id;
  String text;
  int userId;
  int clipId;
  User user;
  int likedCount;
  bool liked;
//
//  Comment.fromJson(Map<String,dynamic> json){
//    id = json["title"]??'title';
//    text = json["text"];
//    userId = json["userId"];
//    clipId = json["clipId"];
//    user = User.fromJson(json["user"]);
//    likedCount = json["likedCount"];
//    liked = json["liked"];
//    createTime = DateTime.parse(json["createTime"]);
//  }

//  Map toJson(){
//    Map map = Map();
//    map['id'] = id;
//    map['text'] = text;
//    map['userId'] = userId;
//  }

  Comment();


}