import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';

enum HomeAction {
  fetchRecommend,
  add,
  fetchSuccess,
  fetchFailure,
  refresh,
  loadMore,
  loadSuccess,
  loadFailure
}

class HomeActionCreator {
  static Action fetchRecommend() {
    return const Action(HomeAction.fetchRecommend);
  }
  static Action onAdd(){
    return const Action(HomeAction.add);
  }
  static Action fetchSuccess(ClipPage clipPage){
    return  Action(HomeAction.fetchSuccess,payload: clipPage);
  }

  static Action fetchFailure(){
    return const Action(HomeAction.fetchFailure);
  }

  static Action refresh(){
    return const Action(HomeAction.refresh);
  }

  static Action loadMore(){
    return const Action(HomeAction.loadMore);
  }

  static Action loadSuccess(ClipPage clipPage){
    return Action(HomeAction.loadSuccess,payload: clipPage);
  }

  static Action loadFailure(){
    return const Action(HomeAction.loadFailure);
  }
}
