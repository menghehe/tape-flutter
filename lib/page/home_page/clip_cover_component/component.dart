import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ClipCoverComponent extends Component<ClipCoverState> {
  ClipCoverComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClipCoverState>(
                adapter: null,
                slots: <String, Dependent<ClipCoverState>>{
                }),);

}
