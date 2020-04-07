import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';

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
  final CreationState newState = state.clone();
  newState.videoPlayerController = action.payload;
  newState.chewieController = ChewieController(
    videoPlayerController: newState.videoPlayerController,
    aspectRatio: newState.videoPlayerController.value.aspectRatio,
    autoPlay: true,
    looping: false,
    showControls: true,
    materialProgressColors: ChewieProgressColors(
      playedColor: Colors.red,
      handleColor: Colors.blue,
      backgroundColor: Colors.grey,
      bufferedColor: Colors.lightGreen,
    ),
    placeholder: Container(
      color: Colors.grey,
    ),
  );
  return newState;
}

CreationState _onPostSuccess(CreationState state, Action action) {
  state.progressDialog.hide();
  final CreationState newState = state.clone();
  newState.videoFile = null;
  newState.titleEditingController.text = null;
  Fluttertoast.showToast(msg: "发布成功");
  return newState;
}

CreationState _onPostFailure(CreationState state, Action action) {
  state.progressDialog.hide();
  final CreationState newState = state.clone();
  Fluttertoast.showToast(msg: "发布失败");
  return newState;
}

