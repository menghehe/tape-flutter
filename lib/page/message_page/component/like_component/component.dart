import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'effect.dart';
import 'state.dart';
import 'view.dart';

class LikeComponent extends Component<LikeState> {
  LikeComponent()
      : super(
          shouldUpdate: (oldState, newState) {
            return true;
          },
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LikeState>(
              adapter: null, slots: <String, Dependent<LikeState>>{}),
        );
}
