import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

//TODO replace with your own action
enum CreationAction { action, imageButtonPressed,pickComplete,videoSelected,removePreview,postClip,postSuccess,postFailure}

class CreationActionCreator {
  static Action onRemovePreview() {
    return const Action(CreationAction.removePreview);
  }

  static Action onImageButtonPressed(ImageSource imageSource) {
    return Action(CreationAction.imageButtonPressed,payload: imageSource);
  }

  static Action onPickComplete(File videoFile){
    return Action(CreationAction.pickComplete,payload: videoFile);
  }

  static Action onVideoSelected(File videoFile){
    return Action(CreationAction.videoSelected,payload: videoFile);
  }

  static Action onPostClip(){
    return const Action(CreationAction.postClip);
  }

  static Action onPostSuccess(){
    return const Action(CreationAction.postSuccess);
  }

  static Action onPostFailure(){
    return const Action(CreationAction.postFailure);
  }
}
