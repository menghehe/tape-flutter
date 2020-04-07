import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/user.dart';

@JsonSerializable()
class Comment extends Base{
  int id;
  String text;
  int fromId;
  int toId;
  int clipId;
  User user;
  int likedCount;
  bool liked;
  Clip clip;

  Comment();


}

@JsonSerializable()
class CommentPage extends BasePage{
  List<Comment> records;
}