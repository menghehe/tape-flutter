import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tape/page/creation_page/action.dart';
import 'package:tape/utils/adapt.dart';
import 'package:video_player/video_player.dart';

import 'state.dart';

Widget buildView(
    CreationState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  Widget _previewVideo() {
    if (state.videoFile == null ||
        state.videoPlayerController.value.initialized == false) {
      return const Text(
        '从相册选择或拍摄',
        textAlign: TextAlign.center,
      );
    }
    return Chewie(
      controller: state.chewieController,
    );
  }

  return Scaffold(
    appBar: PreferredSize(
        child: AppBar(
          title: Text(
            '创作',
            style: TextStyle(
              color: Colors.black87,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              fontWeight: FontWeight.w100
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton(
              textColor: Colors.black,
              onPressed: () => dispatch(CreationActionCreator.onPostClip()),
              child: Icon(Icons.send),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(Adapt.screenH() * 0.07)),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            controller: state.titleEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.green.withAlpha(30),
              hintText: '标题',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: _previewVideo(),
          )
        ],
      ),
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
          onTap: () {
            dispatch(CreationActionCreator.onRemovePreview());
            dispatch(CreationActionCreator.onImageButtonPressed(
                ImageSource.gallery));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.videocam),
          backgroundColor: Colors.blue,
          onTap: () {
            dispatch(CreationActionCreator.onRemovePreview());
            dispatch(
                CreationActionCreator.onImageButtonPressed(ImageSource.camera));
          },
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
