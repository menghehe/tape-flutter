import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/user.dart';

enum ProfileAction { fetchUserInfo,fetchUserInfoSuccess,fetchUserInfoFailure,fetchUserClip,fetchUserClipSuccess,fetchUserClipFailure, onRefresh,tapClipCover,tapFriendShip,changeFriendShip}

class ProfileActionCreator {

  static Action fetchUserInfo() {
    return const Action(ProfileAction.fetchUserInfo);
  }

  static Action fetchUserInfoSuccess(User user) {
    return Action(ProfileAction.fetchUserInfoSuccess, payload: user);
  }

  static Action fetchUserInfoFailure() {
    return const Action(ProfileAction.fetchUserInfoFailure);
  }

  static Action onFetchUserClip(){
    return const Action(ProfileAction.fetchUserClip);
  }

  static Action fetchUserClipSuccess(ClipPage clipPage) {
    return Action(ProfileAction.fetchUserClipSuccess, payload: clipPage);
  }

  static Action fetchUserClipFailure() {
    return const Action(ProfileAction.fetchUserClipFailure);
  }

  static Action onRefresh(){
    return const Action(ProfileAction.onRefresh);
  }

  static Action onTapClipCover(Clip clip){
    return Action(ProfileAction.tapClipCover,payload: clip);
  }

  static Action onTapFriendShip(){
    return const Action(ProfileAction.tapFriendShip);
  }
}
