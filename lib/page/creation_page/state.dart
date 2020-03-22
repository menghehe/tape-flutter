import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';

class CreationState implements Cloneable<CreationState> {

  @override
  CreationState clone() {
    return CreationState()
        ..videoPlayerController = videoPlayerController
      ..chewieController = chewieController
        ..videoFile = videoFile;
  }

  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  File videoFile;
}

CreationState initState(Map<String, dynamic> args) {
  return CreationState();
}
