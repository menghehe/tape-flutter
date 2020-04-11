import 'package:fish_redux/fish_redux.dart';
import 'package:tape/page/message_page/component/comment_component/component.dart';
import 'package:tape/page/message_page/component/comment_component/state.dart' hide initState;
import 'package:tape/page/message_page/component/like_component/component.dart';
import 'package:tape/page/message_page/component/like_component/state.dart' hide initState;

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MessagePage extends Page<MessageState, MessageState>  with SingleTickerProviderMixin{
  MessagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MessageState>(
              adapter: null,
                slots: <String, Dependent<MessageState>>{
                  'commentComponent':CommentConnector()+CommentComponent(),
                  'likeComponent':LikeConnector()+LikeComponent(),
                }),
            middleware: <Middleware<MessageState>>[
            ],);

}
