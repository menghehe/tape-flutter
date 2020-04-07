import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';

@JsonSerializable()
class Like extends Base {
  int id;
  int likeType;
  int fromId;
  int toId;
  int targetId;
  Clip clip;
  Comment comment;
}