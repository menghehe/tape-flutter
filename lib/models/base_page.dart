import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';

@JsonSerializable()
class BasePage{
  int total;
  int size;
  int current;

}
