import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:neeko/neeko.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CreationState implements Cloneable<CreationState> {

  @override
  CreationState clone() {
    return CreationState()
        ..videoFile = videoFile
        ..progressDialog = progressDialog
        ..titleEditingController = titleEditingController
        ..videoControllerWrapper = videoControllerWrapper;
  }

  VideoControllerWrapper videoControllerWrapper;
  File videoFile;

  TextEditingController titleEditingController;

  ProgressDialog progressDialog;
}

CreationState initState(Map<String, dynamic> args) {
  return CreationState()
      ..titleEditingController = TextEditingController();
}
