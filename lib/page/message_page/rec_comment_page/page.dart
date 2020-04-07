import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecCommentPage extends Page<RecCommentState, Map<String, dynamic>> {
  RecCommentPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecCommentState>(
                adapter: null,
                slots: <String, Dependent<RecCommentState>>{
                }),
            middleware: <Middleware<RecCommentState>>[
            ],);

}
