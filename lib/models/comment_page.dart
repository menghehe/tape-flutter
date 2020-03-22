import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base_page.dart';
import 'package:tape/models/comment.dart';

@JsonSerializable()
class CommentPage extends BasePage{
  List<Comment> records;
}