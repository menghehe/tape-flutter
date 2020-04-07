import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/customer_widgets/video_player_item.dart';
import 'package:tape/page/home_page/clip_cover_component/action.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(
    ClipCoverState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Card(
      margin: EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                width: Adapt.screenW(),
                height: Adapt.screenW() * 9 / 16,
                child: SizedBox.expand(
                  child: new FittedBox(
                      fit: BoxFit.cover,
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/CacheBG.jpg',
                          image: Address.BASE_COVER_URL + state.clip.coverPath)),
                ),
              ),
              onTap: () => {dispatch(ClipCoverActionCreator.tapPlayer())},
            ),
            InkWell(
              onTap: (){dispatch(ClipCoverActionCreator.tapUserAvatar());},
              child: Container(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        Address.BASE_AVATAR_URL + state.clip.user.avatar),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    state.clip.user.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    TimelineUtil.format(
                      state.clip.createTime.millisecondsSinceEpoch,
                      locTimeMillis:
                      DateTime.now().toLocal().millisecondsSinceEpoch,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
