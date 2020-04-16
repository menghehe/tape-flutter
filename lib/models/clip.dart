import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/user.dart';

@JsonSerializable()
class Clip extends Base{
  int id;
  String title;
  String clipPath;
  String coverPath;
  int creator;
  String coverTime;
  User user;
  int likeCount;
  int commentCount;
  int viewCount;
  int shareCount;
  int collectCount;
  bool liked;
  int rank;


  Clip();


}

@JsonSerializable()
class ClipPage extends BasePage{
  List<Clip> records;
}



