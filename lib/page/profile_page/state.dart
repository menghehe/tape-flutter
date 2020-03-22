import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/clip_page.dart';
import 'package:tape/models/user.dart';

class ProfileState implements Cloneable<ProfileState> {

  @override
  ProfileState clone() {
    return ProfileState()
        ..user = user
        ..clipPage = clipPage
      ..refreshController=refreshController
        ..clipList = clipList;

  }

  User user = User();
  ClipPage clipPage = new ClipPage();
  List<Clip> clipList = List();
  RefreshController refreshController = RefreshController();
}

ProfileState initState(Map<String, dynamic> args) {
  User user = User();
  user.avatar = 'https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg';
  user.username = 'username';
  user.signature = 'signature';
  return ProfileState()
      ..user = user;
}
