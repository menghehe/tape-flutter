import 'dart:io';

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClipRecordAction { action,pickVideoFromCamera,finishPick ,play, next}

class ClipRecordActionCreator {
  static Action onAction() {
    return const Action(ClipRecordAction.action);
  }

  static Action onPickVideoFromCamera(){
    return const Action(ClipRecordAction.pickVideoFromCamera);
  }
  static Action onFishPick(File video){
    return Action(ClipRecordAction.finishPick, payload: video);
  }

  static Action onPlay(){
    return Action(ClipRecordAction.play);
  }

  static Action onNext(){
    return Action(ClipRecordAction.next);
  }


}
