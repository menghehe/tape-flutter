import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Effect<ClipRecordState> buildEffect() {
  return combineEffects(<Object, Effect<ClipRecordState>>{
    ClipRecordAction.action: _onAction,
    ClipRecordAction.pickVideoFromCamera: _pickVideoFromCamera,
    ClipRecordAction.play:_play,
    ClipRecordAction.next:_next
  });
}

void _onAction(Action action, Context<ClipRecordState> ctx) {
}

void _pickVideoFromCamera(Action action, Context<ClipRecordState> ctx) async {
  File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
  ctx.dispatch(ClipRecordActionCreator.onFishPick(video));
}


void _play(Action action, Context<ClipRecordState> ctx){
  ctx.state.cameraVideoPlayerController.play();
}

void _next(Action action, Context<ClipRecordState> ctx){
  Navigator.of(ctx.context).pushNamed("clipPost",arguments: {"video":ctx.state.cameraVideo});
}