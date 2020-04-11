import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/user.dart';

@JsonSerializable()
class Like extends Base {
  int id;
  int likeType;
  int fromId;
  int toId;
  int targetId;
  Clip clip;
  Comment comment;
  User user;
}

@JsonSerializable()
class LikePage extends BasePage{
  List<Like> records;
}