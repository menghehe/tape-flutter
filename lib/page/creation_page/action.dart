import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:image_picker/image_picker.dart';

//TODO replace with your own action
enum CreationAction { action, imageButtonPressed,pickComplete}

class CreationActionCreator {
  static Action onAction() {
    return const Action(CreationAction.action);
  }

  static Action onImageButtonPressed(ImageSource imageSource) {
    return Action(CreationAction.imageButtonPressed,payload: imageSource);
  }

  static Action onPickComplete(File videoFile){
    return Action(CreationAction.pickComplete,payload: videoFile);
  }
}
