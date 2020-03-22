import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ClipPostState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("发布"),
    ),
    body:ConstrainedBox(constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 20,
            right: 150,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: state.titleEditingController,
              decoration: InputDecoration(
                hintText: "写标题，让更多的人看到"
              ),
            ),
        ),
          Positioned(
              bottom: 20,
              right: 20,
              child: ButtonTheme(
                minWidth: 200,
                height: 60,
                child: FlatButton(
                  child: Text("发布"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: ()=>dispatch(ClipPostActionCreator.onPost()),
                ),
              )
          ),
          Positioned(
            top: 500,
            child:Chewie(
              controller: state.chewieController,
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              child: ButtonTheme(
                minWidth: 200,
                height: 60,
                child: FlatButton(
                  child: Text("存草稿"),
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: (){},
                ),
              )
          )
        ],
      ),
    )
  );
}
