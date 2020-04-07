import 'package:dart_json_mapper/dart_json_mapper.dart';
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
  String registrationId;
  int followingCount;
  int followerCount;
  int clipCount;
  int friendShipStatus;
  User();
}

@JsonSerializable()
class UserPage extends BasePage{
  List<User> records;
}