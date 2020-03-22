import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/clip.dart';
import 'package:video_player/video_player.dart';

class ClipCoverState implements Cloneable<ClipCoverState> {

  @override
  ClipCoverState clone() {
    return ClipCoverState();
  }

  Clip clip;
  VideoPlayerController videoPlayerController;
}

ClipCoverState initState(Clip clip) {
  return ClipCoverState()
  ..clip=clip
      ..videoPlayerController = VideoPlayerController.network(clip.clipPath);
}
