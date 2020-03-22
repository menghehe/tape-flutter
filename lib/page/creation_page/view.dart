import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tape/customer_widgets/video_player_item.dart';
import 'package:tape/page/creation_page/action.dart';
import 'package:video_player/video_player.dart';

import 'state.dart';

Widget buildView(
    CreationState state, Dispatch dispatch, ViewService viewService) {
   Widget _previewVideo() {
     if (state.chewieController == null) {
       return const Text(
         'You have not yet picked a video',
         textAlign: TextAlign.center,
       );
     }
//     return const Text(
//       'You have  yet picked a video',
//       textAlign: TextAlign.center,
//     );
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child:AspectRatioVideo(
         state.videoPlayerController
       )
     );
   }

    return Scaffold(
    body: Center(
      child: _previewVideo(),
    ),
    floatingActionButton: _buildSpeedDial(state, dispatch),
  );

}

Widget _buildSpeedDial(CreationState state, Dispatch dispatch) {
  return Padding(
    padding: EdgeInsets.only(bottom: 50.0),
    child: SpeedDial(
      // both default to 16
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // this is ignored if animatedIcon is non null
      // child: Icon(Icons.add),
      visible: true,
      // If true user is forced to close dial manually
      // by tapping main button and overlay is not rendered.
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(Icons.video_library),
            backgroundColor: Colors.red,
          onTap: () => dispatch(CreationActionCreator.onImageButtonPressed(ImageSource.gallery)),
        ),
        SpeedDialChild(
          child: Icon(Icons.videocam),
          backgroundColor: Colors.blue,
          onTap: () => dispatch(CreationActionCreator.onImageButtonPressed(ImageSource.camera)),
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice),
          backgroundColor: Colors.green,
          onTap: () => print('THIRD CHILD'),
        ),
      ],
    ),
  );
}

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}

