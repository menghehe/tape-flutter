import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';

enum HomeAction {
  fetchRecommend,
  fetchSuccess,
  fetchFailure,
  refresh,
  loadMore,
  loadSuccess,
  loadFailure,
  fetchHot,
  fetchHotSuccess,
  fetchHotFailure,
  dropDownChange,
  dropDownValue,
}

class HomeActionCreator {

  static Action dropDownChange(String value) {
    return Action(HomeAction.dropDownChange,payload: value);
  }


  static Action dropDownValue(String value) {
    return Action(HomeAction.dropDownValue,payload: value);
  }

  static Action fetchRecommend() {
    return const Action(HomeAction.fetchRecommend);
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

  static Action fetchHot(){
    return const Action(HomeAction.fetchHot);
  }

  static Action fetchHotSuccess(List<Clip> clipList){
    return Action(HomeAction.fetchHotSuccess,payload: clipList);
  }

  static Action fetchHotFailure(){
    return const Action(HomeAction.fetchHotFailure);
  }
}
