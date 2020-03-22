import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/clip_page.dart';
import 'package:tape/models/user.dart';

//TODO replace with your own action
enum ProfileAction { action ,fetchUserInfo,fetchSuccess,fetchUserClip,fetchUserClipSuccess,onRefresh,tapClipCover}

class ProfileActionCreator {
  static Action onAction() {
    return const Action(ProfileAction.action);
  }

  static Action fetchUserInfo() {
    return const Action(ProfileAction.fetchUserInfo);
  }

  static Action fetchSuccess(User user) {
    return Action(ProfileAction.fetchSuccess, payload: user);
  }

  static Action onFetchUserClip(){
    return const Action(ProfileAction.fetchUserClip);
  }

  static Action fetchUserClipSuccess(ClipPage clipPage) {
    return Action(ProfileAction.fetchUserClipSuccess, payload: clipPage);
  }

  static Action onRefresh(){
    return const Action(ProfileAction.onRefresh);
  }

  static Action onTapClipCover(Clip clip){
    return Action(ProfileAction.tapClipCover,payload: clip);
  }
}
