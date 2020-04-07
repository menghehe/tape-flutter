import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/user.dart';

enum MineAction { fetchUserInfo,fetchUserInfoSuccess,fetchUserInfoFailure,fetchUserClip,fetchUserClipSuccess,fetchUserClipFailure, onRefresh,tapClipCover,logout}

class MineActionCreator {

  static Action fetchUserInfo() {
    return const Action(MineAction.fetchUserInfo);
  }

  static Action fetchUserInfoSuccess(User user) {
    return Action(MineAction.fetchUserInfoSuccess, payload: user);
  }

  static Action fetchUserInfoFailure() {
    return const Action(MineAction.fetchUserInfoFailure);
  }

  static Action onFetchUserClip(){
    return const Action(MineAction.fetchUserClip);
  }

  static Action fetchUserClipSuccess(ClipPage clipPage) {
    return Action(MineAction.fetchUserClipSuccess, payload: clipPage);
  }

  static Action fetchUserClipFailure() {
    return const Action(MineAction.fetchUserClipFailure);
  }

  static Action onRefresh(){
    return const Action(MineAction.onRefresh);
  }

  static Action onTapClipCover(Clip clip){
    return Action(MineAction.tapClipCover,payload: clip);
  }


  static Action onLogout(){
    return const Action(MineAction.logout);
  }
}
