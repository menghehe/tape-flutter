import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/comment.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentState state, Dispatch dispatch, ViewService viewService) {
  Widget buildComment() {
    if (state.commentList == null) {
      return Center(
        child: Loading(
            indicator: BallPulseIndicator(), size: 100.0, color: Colors.green),
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
      itemCount: state.commentList.length,
      itemBuilder: (BuildContext context, int index) {
        Comment comment = state.commentList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: InkWell(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  Address.BASE_AVATAR_URL + comment.user.avatar,
                ),
                radius: 25,
              ),
              onTap: () {
                dispatch(CommentActionCreator.onTapAvatar(comment));
              },
            ),
            contentPadding: EdgeInsets.all(0),
            title: InkWell(
              child: Text(comment.text),
              onTap: () {
                dispatch(CommentActionCreator.onTapComment(comment));
              },
            ),
            trailing: Text(
              TimelineUtil.format(
                comment.createTime.millisecondsSinceEpoch,
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

  return SmartRefresher(
    controller: state.refreshController,
    header: WaterDropHeader(),
    onRefresh: () => {dispatch(CommentActionCreator.onFetchComment())},
    child: buildComment(),
  );
}
