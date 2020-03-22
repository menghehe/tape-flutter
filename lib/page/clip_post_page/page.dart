import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ClipPostPage extends Page<ClipPostState, Map<String, dynamic>> {
  ClipPostPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClipPostState>(
                adapter: null,
                slots: <String, Dependent<ClipPostState>>{
                }),
            middleware: <Middleware<ClipPostState>>[
            ],);

}
