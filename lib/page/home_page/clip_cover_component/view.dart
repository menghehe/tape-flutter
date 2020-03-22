import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/customer_widgets/video_player_item.dart';
import 'package:tape/page/home_page/clip_cover_component/action.dart';

import 'state.dart';

Widget buildView(ClipCoverState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Card(
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              child: VideoPlayerItem(
                vc: state.videoPlayerController,
                coverurl:Address.BASE_COVER_URL+ state.clip.thumbnail,
                showplayer: true,
              )
            ),
          ),
          InkWell(
            child: Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                     Address.BASE_AVATAR_URL+ state.clip.user.avatar
                  ),
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  state.clip.user.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  state.clip.createTime.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            onTap: ()=>{dispatch(ClipCoverActionCreator.tapPlayer())},
          ),
        ],
      ),
    ),
  );

}
