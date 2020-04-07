import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:video_player/video_player.dart';

class CreationState implements Cloneable<CreationState> {

  @override
  CreationState clone() {
    return CreationState()
        ..videoFile = videoFile
        ..progressDialog = progressDialog
        ..chewieController = chewieController
        ..videoPlayerController = videoPlayerController
        ..titleEditingController = titleEditingController;
  }

  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  File videoFile;

  TextEditingController titleEditingController;

  ProgressDialog progressDialog;
}

CreationState initState(Map<String, dynamic> args) {
  return CreationState()
      ..titleEditingController = TextEditingController();
}
