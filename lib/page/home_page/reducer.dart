import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/page/home_page/clip_cover_component/state.dart' as clipCoverComponent;

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.fetchSuccess:_fetchSuccess,
      HomeAction.fetchFailure:_fetchFailure,
      HomeAction.loadSuccess:_loadSuccess,
      HomeAction.loadFailure:_loadFailure,
    },
  );
}

HomeState _fetchSuccess(HomeState state, Action action){
  final List<Clip> clipList = action.payload ??<clipCoverComponent.ClipCoverState>[];
  final HomeState newState = state.clone();
  List<clipCoverComponent.ClipCoverState> clipCoverStateList = [];
  clipList.forEach((clip)=>{clipCoverStateList.add(clipCoverComponent.initState(clip))});
  newState.clipCoverStateList = clipCoverStateList;
  newState.refreshController.refreshCompleted();
  return newState;
}

HomeState _fetchFailure(HomeState state, Action action){
  final HomeState newState = state.clone();
  newState.refreshController.loadFailed();
  return newState;
}

HomeState _loadSuccess(HomeState state, Action action){
  final List<Clip> clipList = action.payload ??<clipCoverComponent.ClipCoverState>[];
  final HomeState newState = state.clone();
  List<clipCoverComponent.ClipCoverState> clipCoverStateList = [];
  clipList.forEach((clip)=>{clipCoverStateList.add(clipCoverComponent.initState(clip))});
  newState.clipCoverStateList = clipCoverStateList;
  newState.refreshController.loadComplete();
  return newState;
}

HomeState _loadFailure(HomeState state, Action action){
  final HomeState newState = state.clone();
  newState.refreshController.loadFailed();
  return newState;
}
