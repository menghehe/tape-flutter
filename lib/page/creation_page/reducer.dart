import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neeko/neeko.dart';

import 'action.dart';
import 'state.dart';

Reducer<CreationState> buildReducer() {
  return asReducer(
    <Object, Reducer<CreationState>>{
      CreationAction.removePreview: _onRemovePreview,
      CreationAction.pickComplete:_onPickComplete,
      CreationAction.postSuccess:_onPostSuccess,
      CreationAction.postFailure:_onPostFailure,
    },
  );
}

CreationState _onRemovePreview(CreationState state, Action action) {
  final CreationState newState = state.clone();
  newState.videoFile = null;
  return newState;
}

CreationState _onPickComplete(CreationState state, Action action) {
  if(action.payload==null){
    return state;
  }
  final CreationState newState = state.clone();
  newState.videoFile = action.payload;
  newState.videoControllerWrapper = VideoControllerWrapper(
    DataSource.file(action.payload)
  );
  return newState;
}

CreationState _onPostSuccess(CreationState state, Action action) {
  state.progressDialog.hide();
  final CreationState newState = state.clone();
  newState.videoFile = null;
  newState.videoControllerWrapper.dispose();
  newState.titleEditingController.text = null;
  Fluttertoast.showToast(msg: "发布成功");
  return newState;
}

CreationState _onPostFailure(CreationState state, Action action) {
  state.progressDialog.hide();
  final CreationState newState = state.clone();
  newState.videoFile = null;
  newState.videoControllerWrapper.dispose();
  newState.titleEditingController.text = null;
  Fluttertoast.showToast(msg: "发布失败{如果显示超时可能是因为dio的bug，暂时无解}");
  return newState;
}

