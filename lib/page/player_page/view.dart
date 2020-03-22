import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/customer_widgets/sliverappbardelegate.dart';
import 'package:tape/customer_widgets/video_player_item.dart';
import 'package:tape/page/player_page/action.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(PlayerState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    //backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                controller: state.scrollController,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: Adapt.screenW() * 9 / 16,
                      maxHeight: Adapt.screenW() * 9 / 16,
                      child: Container(
                        child: getVideoPlayer(state),
                        color: Colors.black,
                        height: Adapt.screenW() * 9 / 16,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Adapt.px(50),
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
                            '次观看',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: Adapt.px(25)),
                          ),
                          SizedBox(height: Adapt.px(20)),
                          Text(
                            state.clip.createTime.toString()+'发布',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: Adapt.px(30)),
                          ),
                          SizedBox(height: Adapt.px(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: Colors.grey[600],
                                      size: Adapt.px(45),
                                    ),
                                    onPressed: () {},
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
                                      Icons.library_add,
                                      color: Colors.grey[600],
                                      size: Adapt.px(45),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "subcount".toString(),
                                    style: TextStyle(color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.textsms,
                                      color: Colors.grey[600],
                                      size: Adapt.px(45),
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
                                      Icons.share,
                                      color: Colors.grey[600],
                                      size: Adapt.px(45),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "sharecount".toString(),
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
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: Adapt.px(100),
                      maxHeight: Adapt.px(100),
                      child: Container(
                        color: Colors.white,
                        height: Adapt.px(100),
                        padding: EdgeInsets.all(Adapt.px(20)),
                        child: getCreatorIcon(state),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey[300],
                      height: Adapt.px(20),
                    ),
                  ),
//                  SliverToBoxAdapter(
//                    child: getSimiVideoCells(similarVideos),
//                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(20)),
                      child: Text(
                        '最新评论('+state.clip.commentCount.toString()+')',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: Adapt.px(35)),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return buildCommentCell(index,state);
                          }, childCount: state.commentList.length)),
//                  SliverToBoxAdapter(
//                      child: Container(
//                        height: Adapt.px(80),
//                        padding: EdgeInsets.all(Adapt.px(5)),
//                        child: Center(
//                          child: true
//                              ? CircularProgressIndicator(
//                            strokeWidth: Adapt.px(3),
//                          )
//                              : null,
//                        ),
//                      ))
                ],
              ),
              new Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                    brightness: Brightness.dark,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: <Widget>[
                      IconButton(onPressed: () {}, icon: Icon(Icons.share))
                    ],
                    centerTitle: false),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
//                height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(0.0, 1.5),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 190,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: TextField(
                            controller: state.commentEditController,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Colors.grey,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "写评论...",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                            maxLines: null,
                          ),

                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_upward,
                              color: Colors.grey,
                            ),
                            onPressed: (){dispatch(PlayerActionCreator.onAddComment());},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

}

Widget buildCommentCell(int index, PlayerState state) {
  if (state.commentList.length == 0)
    return Container();
  else {
    var c = state.commentList[index];
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
                image: Address.BASE_AVATAR_URL+ c.user.avatar,
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
                          c.user.username,
                          style: TextStyle(fontSize: Adapt.px(24)),
                        ),
                        Text(
                          TimelineUtil.format(
                            c.createTime.millisecondsSinceEpoch,
                            locTimeMillis: DateTime.now().millisecondsSinceEpoch,
                            locale: 'zh_cloudmusic',
                          ),
                          style: TextStyle(fontSize: Adapt.px(18)),
                        ),
                        SizedBox(
                          height: Adapt.px(10),
                        ),
                        Text(
                          c.text,
                          softWrap: true,
                          style: TextStyle(
                              height: 1.2,
                              color: Colors.black,
                              fontSize: Adapt.px(28)),
                        ),
                        SizedBox(
                          height: Adapt.px(20),
                        ),
                        Container(
                          color: Colors.grey[200],
                          height: 1,
                        )
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
                              c.likedCount > 0 ? c.likedCount.toString() : '',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: Adapt.px(20)),
                            ),
                          ),
                          Container(
                            width: Adapt.px(40),
                            child: IconButton(
                              color: c.liked??false
                                  ? Colors.red[400]
                                  : Colors.grey[400],
                              padding: EdgeInsets.all(2),
                              alignment: Alignment.centerRight,
                              icon: Icon(Icons.thumb_up),
                              iconSize: Adapt.px(30),
                              onPressed: () {
//                                int count = c.likeCount;
////                                if (!c.liked) {
////                                  count++;
////                                } else if (count > 0) {
////                                  count--;
////                                }
////                                setState(() {
////                                  c.likedCount = count;
////                                  c.liked = !c.liked;
////                                });
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
  }
}

Widget getCreatorIcon(PlayerState state) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(
        width: Adapt.px(60),
        height: Adapt.px(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Adapt.px(30)),
          image: DecorationImage(
              image: NetworkImage(Address.BASE_AVATAR_URL+ state.clip.user.avatar),
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
              borderRadius: BorderRadius.circular(Adapt.px(20)),
              color: Colors.red),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: Adapt.px(20),
                ),
                Text(
                  '收藏',
                  style:
                  TextStyle(color: Colors.white, fontSize: Adapt.px(20)),
                )
              ]))
    ]);
}

Widget getVideoPlayer(PlayerState state) {
  return VideoPlayerItem(
    vc: state.videoPlayerController,
    showplayer: true,
    coverurl: Address.BASE_COVER_URL+state.clip.thumbnail,
  );
}


