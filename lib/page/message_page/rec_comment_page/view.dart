import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/page/message_page/rec_comment_page/action.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(RecCommentState state, Dispatch dispatch, ViewService viewService) {

  Widget buildComment(){
    if(state.commentList==null){
      return Text('还没有收到过评论');
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
                  Address.BASE_AVATAR_URL+comment.user.avatar,
                ),
                radius: 25,
              ),
              onTap: (){
                dispatch(RecCommentActionCreator.onTapAvatar(comment));
              },
            ),
            contentPadding: EdgeInsets.all(0),
            title: InkWell(
              child: Text(
                comment.text
              ),
              onTap: (){
                dispatch(RecCommentActionCreator.onTapComment(comment));
              },
            ),
            trailing: Text(
              TimelineUtil.format(
                comment.createTime.millisecondsSinceEpoch,
                locTimeMillis:
                DateTime.now().toLocal().millisecondsSinceEpoch,
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

  return Scaffold(
    appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('创作' ,style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
        ),
        preferredSize: Size.fromHeight(Adapt.screenH() * 0.06)
    ),
    body: SmartRefresher(
      controller: state.refreshController,
      header: WaterDropHeader(),
      onRefresh: ()=>{dispatch(RecCommentActionCreator.onFetchComment())},
      child: buildComment(),
    ),
  );
}
