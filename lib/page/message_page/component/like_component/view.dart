import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/like.dart';
import 'package:tape/utils/adapt.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LikeState state, Dispatch dispatch, ViewService viewService) {
  Widget buildLike() {
    if (state.likeList == null) {
      return Center(
          child: LoadingBouncingLine.circle(
            backgroundColor: Colors.green,
          )
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: state.likeList.length,
      itemBuilder: (BuildContext context, int index) {
        Like like = state.likeList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: InkWell(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  Address.BASE_AVATAR_URL + like.user.avatar,
                ),
                radius: 25,
              ),
              onTap: () {
                dispatch(LikeActionCreator.onTapAvatar(like));
              },
            ),
            contentPadding: EdgeInsets.all(0),
            title: InkWell(
              child: like.likeType == 1?Text('给你的视频点了赞'):Text('给你的评论点了赞'),
              onTap: () {
//                dispatch(LikeActionCreator.onTapContent(like));
              },
            ),
            trailing: Text(
              TimelineUtil.format(
                like.createTime.millisecondsSinceEpoch,
                locTimeMillis: DateTime.now().toLocal().millisecondsSinceEpoch,
              ),
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),
          ),
        );
      },
    );
  }

  return Padding(
    padding: EdgeInsets.only(bottom: ScreenUtil.getInstance().screenHeight*0.08),
    child: buildLike(),
  );

//  return SmartRefresher(
//    controller: state.refreshController,
//    header: WaterDropHeader(),
//    onRefresh: () => {dispatch(LikeActionCreator.onFetchLike())},
//    child: buildComment(),
//  );
}
