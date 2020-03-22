import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';

//TODO replace with your own action
enum HomeAction { fetchRecommend,add,fetchSuccess,fetchFailure,refresh,loadMore, loadSuccess,loadFailure}

class HomeActionCreator {
  static Action fetchRecommend() {
    return const Action(HomeAction.fetchRecommend);
  }
  static Action onAdd(){
    return const Action(HomeAction.add);
  }
  static Action fetchSuccess(List<Clip> clipList){
    return  Action(HomeAction.fetchSuccess,payload: clipList);
  }

  static Action fetchFailure(){
    return const Action(HomeAction.fetchFailure);
  }

  static Action refresh(){
    return const Action(HomeAction.refresh);
  }

  static Action loadMore(List<Clip> clipList){
    return const Action(HomeAction.loadMore);
  }

  static Action loadSuccess(List<Clip> clipList){
    return Action(HomeAction.loadSuccess,payload: clipList);
  }

  static Action loadFailure(){
    return const Action(HomeAction.loadFailure);
  }
}
