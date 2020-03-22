import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ClipRecordState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Image / Video Picker"),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              if(state.cameraVideo != null)
                Chewie(
                  controller: state.chewieController,
                  )
              else
                Text("Click on Pick Video to select video", style: TextStyle(fontSize: 18.0),),
              RaisedButton(
                onPressed: () {
                  dispatch(ClipRecordActionCreator.onPickVideoFromCamera());
                },
                child: Text("Pick Video From Camera"),
              ),
              RaisedButton(
                onPressed: () {
                  dispatch(ClipRecordActionCreator.onPlay());
                },
                child: Text("play"),
              ),
              RaisedButton(
                onPressed: () {
                  dispatch(ClipRecordActionCreator.onNext());
                },
                child: Text("下一步"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
