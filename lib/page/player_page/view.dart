import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/customer_widgets/sliverappbardelegate.dart';
import 'package:tape/customer_widgets/video_player_item.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';
import 'package:tape/page/player_page/action.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(
    PlayerState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  if (state.clip == null) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Loading(
              indicator: BallPulseIndicator(), size: 100.0, color: Colors.pink),
        ),
      ),
    );
  }

  Widget buildComment() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      Comment comment = state.commentList[index];
      return Container(
          padding: EdgeInsets.only(left: Adapt.px(30), bottom: Adapt.px(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(Adapt.px(30)),
                child: FadeInImage.assetNetwork(
                  width: Adapt.px(60),
                  placeholder: 'images/CacheBG.jpg',
                  image: Address.BASE_AVATAR_URL + comment.user.avatar,
                ),
              ),
              SizedBox(
                width: Adapt.px(15),
              ),
              Container(
                  width: Adapt.screenW() * 0.8,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            comment.user.username,
                            style: TextStyle(fontSize: Adapt.px(24)),
                          ),
                          Text(
                            TimelineUtil.format(
                              comment.createTime.millisecondsSinceEpoch,
                              locTimeMillis:
                                  DateTime.now().millisecondsSinceEpoch,
                            ),
                            style: TextStyle(fontSize: Adapt.px(18)),
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          Text(
                            comment.text,
                            softWrap: true,
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: Adapt.px(28)),
                          ),
                          SizedBox(
                            height: Adapt.px(20),
                          ),
                        ],
                      ),
                      Container(
                        height: Adapt.px(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                comment.likedCount > 0
                                    ? comment.likedCount.toString()
                                    : '',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: Adapt.px(20)),
                              ),
                            ),
                            Container(
                              width: Adapt.px(40),
                              child: IconButton(
                                color: comment.liked? Colors.red[400] : Colors.grey[400],
                                padding: EdgeInsets.all(2),
                                alignment: Alignment.centerRight,
                                icon: Icon(LineIcons.thumbs_o_up),
                                iconSize: Adapt.px(40),
                                onPressed: () {
                                  Like like = Like();
                                  like.likeType = 2;
                                  like.comment = comment;
                                  like.toId = comment.fromId;
                                  like.targetId = comment.id;
                                  dispatch(PlayerActionCreator.onTapLike(like));
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ));
    }, childCount: state.commentList.length));
  }

  return Scaffold(
      body: Container(
//        padding: EdgeInsets.only(top: 0),
    child: Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: state.scrollController,
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: false,
                delegate: SliverAppBarDelegate(
                  minHeight: Adapt.screenW() * 9 / 16,
                  maxHeight: Adapt.screenW() * 9 / 16,
                  child: Container(
                    child: buildVideoPlayer(state),
                    color: Colors.black,
                    height: Adapt.screenW() * 9 / 16,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Adapt.px(20),
                      left: Adapt.px(30),
                      right: Adapt.px(30),
                      bottom: Adapt.px(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.clip.title ?? '无题',
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.black, fontSize: Adapt.px(40)),
                      ),
                      SizedBox(height: Adapt.px(20)),
                      Text(
                        state.clip.viewCount.toString() +
                            '次观看   ' +
                            TimelineUtil.format(
                              state.clip.createTime.millisecondsSinceEpoch,
                              locTimeMillis: DateTime.now()
                                  .toLocal()
                                  .millisecondsSinceEpoch,
                            ) +
                            '发布',
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: Adapt.px(25)),
                      ),
                      SizedBox(height: Adapt.px(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  LineIcons.thumbs_o_up,
                                  color: state.clip.liked==true?Colors.red:Colors.grey[600],
                                  size: Adapt.px(55),
                                ),
                                onPressed: () {
                                  Like like = Like();
                                  like.likeType = 1;
                                  like.toId = state.clip.creator;
                                  like.targetId = state.clip.id;
                                  dispatch(PlayerActionCreator.onTapLike(like));
                                },
                                padding: EdgeInsets.all(0),
                              ),
                              Text(
                                state.clip.likeCount.toString(),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  LineIcons.star_o,
                                  color: Colors.grey[600],
                                  size: Adapt.px(55),
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                state.clip.collectCount.toString(),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  LineIcons.comments_o,
                                  color: Colors.grey[600],
                                  size: Adapt.px(55),
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                state.clip.commentCount.toString(),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  LineIcons.share,
                                  color: Colors.grey[600],
                                  size: Adapt.px(55),
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                state.clip.shareCount.toString(),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.grey[200],
                  height: Adapt.px(10),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: Adapt.px(120),
                  maxHeight: Adapt.px(120),
                  child: Container(
                    color: Colors.white,
                    height: Adapt.px(100),
                    padding: EdgeInsets.all(Adapt.px(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: Adapt.px(60),
                            height: Adapt.px(60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Adapt.px(30)),
                              image: DecorationImage(
                                  image: NetworkImage(Address.BASE_AVATAR_URL +
                                      state.clip.user.avatar),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: Adapt.px(10),
                          ),
                          Text(state.clip.user.username),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                              width: Adapt.px(100),
                              height: Adapt.px(40),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Adapt.px(25)),
                                  color: Colors.lightGreen),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: Adapt.px(25),
                                    ),
                                    Text(
                                      '关注',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Adapt.px(25)),
                                    )
                                  ]))
                        ]),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.grey[200],
                  height: Adapt.px(10),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(Adapt.px(20)),
                  child: Text(
                    '最新评论(' + state.clip.commentCount.toString() + ')',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Adapt.px(35)),
                  ),
                ),
              ),
              buildComment(),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Adapt.px(100),
                color: Colors.white.withOpacity(0.9),
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  controller: state.commentEditController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: '写评论...',
                      suffixIcon: IconButton(
                          icon: Icon(
                            LineIcons.arrow_circle_o_up,
                            size: Adapt.px(50),
                          ),
                          onPressed: () {
                            dispatch(PlayerActionCreator.onAddComment());
                          })),
                ),
              )),
        ],
      ),
    ),
  ));
}

Widget buildVideoPlayer(PlayerState state) {
  if (state.videoPlayerController == null) {
    return SizedBox.expand(
      child: new FittedBox(
          fit: BoxFit.cover,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/CacheBG.jpg',
            image: Address.BASE_COVER_URL + state.clip.coverPath,
          )),
    );
  }
  return VideoPlayerItem(
    vc: state.videoPlayerController,
    showplayer: true,
    coverurl: Address.BASE_COVER_URL + state.clip.coverPath,
  );
}
