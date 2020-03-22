import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:video_player/video_player.dart';

import 'action.dart';
import 'state.dart';

Reducer<CreationState> buildReducer() {
  return asReducer(
    <Object, Reducer<CreationState>>{
      CreationAction.action: _onAction,
      CreationAction.pickComplete:_onPickComplete,
    },
  );
}

CreationState _onAction(CreationState state, Action action) {
  final CreationState newState = state.clone();
  return newState;
}

CreationState _onPickComplete(CreationState state, Action action) {
  final CreationState newState = state.clone();
  newState.videoFile = action.payload;
  newState.videoPlayerController = VideoPlayerController.file(newState.videoFile);
  newState.chewieController = ChewieController(
    videoPlayerController: newState.videoPlayerController,
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

