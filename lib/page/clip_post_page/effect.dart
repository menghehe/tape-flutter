import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:tape/api/clip_api.dart';
import 'package:tape/models/clip.dart';
import 'action.dart';
import 'state.dart';

Effect<ClipPostState> buildEffect() {
  return combineEffects(<Object, Effect<ClipPostState>>{
    ClipPostAction.post: _onPost,
  });
}

void _onPost(Action action, Context<ClipPostState> ctx) {
  println(123);
  File video = ctx.state.video;
  Clip clip = Clip();
  clip.title = ctx.state.titleEditingController.value.text;
  Future<dynamic> result = ClipApi.postClip(video, clip);
}

