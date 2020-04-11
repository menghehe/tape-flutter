import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'effect.dart';
import 'state.dart';
import 'view.dart';

class CommentComponent extends Component<CommentState> {
  CommentComponent()
      : super(
          shouldUpdate: (oldState, newState) {
            return true;
          },
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommentState>(
              adapter: null, slots: <String, Dependent<CommentState>>{}),
        );
}
