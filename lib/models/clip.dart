import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/user.dart';

@JsonSerializable()
class Clip extends Base{
  int id;
  String title;
  String clipPath;
  String thumbnail;
  int creator;
  User user;
  int likeCount;
  int commentCount;
  bool liked;

  static Clip fromMap(Map<String,dynamic> map){
    return JsonMapper.fromMap(map);
  }

  static List<Clip> fromList(List<dynamic> map){
    List<Clip> result = List();
    for (var value in map) {
      result.add(fromMap(value));
    }
    return result;
  }

//  @JsonProperty(ignore: true)
//  Clip.fromJson(Map<String,dynamic> json){
//    return JsonMapper.fromMap(json);
////    id = json['id'];
////    title = json["title"]??'title';
////    clipPath = Address.BASE_CLIP_URL + json["clipPath"];
////    thumbnail = Address.BASE_COVER_URL+ json["thumbnail"];
////    user = User.fromJson(json["user"]);
////    likeCount = json["likeCount"];
////    commentCount = json["commentCount"];
////    liked = json["liked"];
////    createTime = DateTime.parse(json["createTime"]);
//


  Clip();


}
//
//class ClipList{
//  List<Clip> data;
//
//  ClipList({this.data});
//
//  ClipList.initialState() {
//    data = [];
//  }
//
//  ClipList.fromJson(List<dynamic> json){
//    data = json.map((item)=>Clip.fromJson(item)).toList();
//  }
//
//  @override
//  String toString() {
//    return "ClipList{data:$data}";
//  }
//
//
//}

