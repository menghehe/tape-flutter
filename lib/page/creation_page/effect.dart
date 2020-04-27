import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neeko/neeko.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tape/api/clip_api.dart';
import 'package:tape/models/clip.dart';
import 'action.dart';
import 'state.dart';

Effect<CreationState> buildEffect() {
  return combineEffects(<Object, Effect<CreationState>>{
    CreationAction.imageButtonPressed:_onImageButtonPressed,
//    CreationAction.videoSelected:_onVideoSelected,
    CreationAction.postClip:_onPostClip,
  });
}

//Future<void> _onVideoSelected(Action action, Context<CreationState> ctx) async {
//  if(action.payload==null){
//    return ctx.dispatch(CreationActionCreator.onPickComplete());
//  }
//  ctx.state.videoFile = action.payload;
//  VideoControllerWrapper videoControllerWrapper = VideoControllerWrapper(
//    DataSource.file(ctx.state.videoFile)
//  );
//  ctx.state.videoControllerWrapper = videoControllerWrapper;
//  return ctx.dispatch(CreationActionCreator.onPickComplete());
//}

Future<void> _onImageButtonPressed(Action action, Context<CreationState> ctx) async {
  File file = await ImagePicker.pickVideo(source: action.payload);
  await ctx.dispatch(CreationActionCreator.onPickComplete(file));
}

void _onPostClip(Action action, Context<CreationState> ctx){
  if(ctx.state.videoFile==null){
    Fluttertoast.showToast(msg: '请先选择或拍摄一个视频文件');
    return;
  }
  if(ctx.state.progressDialog==null){
    ctx.state.progressDialog = ProgressDialog(ctx.context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    ctx.state.progressDialog.style(
        message: '发布中',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
  }
  ctx.state.progressDialog.show();
  Clip clip = Clip();
  clip.title = ctx.state.titleEditingController.value.text;
  clip.coverTime = ctx.state.videoControllerWrapper.controller.value.position.toString();
  Future future = ClipApi.postClip(ctx.state.videoFile, clip);
  future.then((result){
    if(result.isSuccess){
      ctx.dispatch(CreationActionCreator.onPostSuccess());
    }else{
      ctx.dispatch(CreationActionCreator.onPostFailure());
    }
  });
}
