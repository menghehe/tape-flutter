import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/base.dart';

@JsonSerializable()
class User extends Base {
  int id;
  String username;
  String password;
  String nickname;
  String phone;
  String email;
  String avatar;
  String signature;

//  User.fromJson(Map<String,dynamic> json){
//    username = json["username"]??'username';
//    password = json["password"];
//    nickname = json["nickname"];
//    phone = json["phone"];
//    email = json["email"];
//    avatar = Address.BASE_AVATAR_URL + json["avatar"];
//    signature = json["signature"]??'signature';
//  }

  User();


}