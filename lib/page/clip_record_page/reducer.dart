import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:video_player/video_player.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClipRecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClipRecordState>>{
      ClipRecordAction.action: _onAction,
      ClipRecordAction.finishPick: _onFinishPick,
    },
  );
}

ClipRecordState _onAction(ClipRecordState state, Action action) {
  final ClipRecordState newState = state.clone();
  return newState;
}

ClipRecordState _onFinishPick(ClipRecordState state, Action action) {
  final ClipRecordState newState = state.clone();
  newState.cameraVideo = action.payload;
  newState.cameraVideoPlayerController = VideoPlayerController.file(newState.cameraVideo);
  newState.chewieController = ChewieController(
    videoPlayerController: newState.cameraVideoPlayerController,
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
