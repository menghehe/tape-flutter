import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/user.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ProfileState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  Widget buildFriendStatusButton() {
    User friend = state.profileUser;
    if (friend.friendShipStatus == 0) {
      return FlatButton(
        child: Text(
          "关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: () {},
      );
    }

    if (friend.friendShipStatus == 1) {
      return FlatButton(
        child: Text(
          "取消关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.red,
        onPressed: () {},
      );
    }

    if (friend.friendShipStatus == 2) {
      return FlatButton(
        child: Text(
          "回粉",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: () {},
      );
    }

    if (friend.friendShipStatus == 3) {
      return FlatButton(
        child: Text(
          "互相关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: () {},
      );
    }

    return FlatButton(
      child: Text(
        "我自己",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.green,
      onPressed: () {},
    );
  }

  Widget _buildMessageBox(){
    if(state.profileUser.friendShipStatus==-1){
      return SizedBox(height: 0,);
    }else{
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            color: Colors.grey,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          buildFriendStatusButton()
        ],
      );
    }
  }


  return Scaffold(
    body: NestedScrollView(
        controller: state.scrollController,
        headerSliverBuilder: (c, s) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 300.0,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              Address.BASE_AVATAR_URL +
                                  state.profileUser.avatar),
                          radius: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          state.profileUser.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          state.profileUser.signature ?? '签名...',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 20),
                        _buildMessageBox(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    state.profileUser.clipCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "视频",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    state.profileUser.followingCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "关注",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    state.profileUser.followerCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "粉丝",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
        body: Container(
          child: SmartRefresher(
              controller: state.refreshController,
              enablePullDown: true,
              header: WaterDropHeader(),
              enablePullUp: true,
              onRefresh: () {
                dispatch(ProfileActionCreator.onRefresh());
              },
              onLoading: () {
                dispatch(ProfileActionCreator.onRefresh());
              },
              child: _buildClipList(state, dispatch)),
        )),
  );
}

Widget _buildClipList(ProfileState state, dispatch) {
  if (state.clipList.length == 0) {
    return Container();
  }
  return new StaggeredGridView.countBuilder(
    shrinkWrap: true,
    crossAxisCount: 4,
    itemCount: state.clipList.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
          padding: EdgeInsets.all(5.0),
          child: InkWell(
            child: Image.network(
              Address.BASE_COVER_URL + state.clipList[index].coverPath,
              fit: BoxFit.cover,
            ),
            onTap: () {
              dispatch(
                  ProfileActionCreator.onTapClipCover(state.clipList[index]));
            },
          ));
    },
    staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
}
