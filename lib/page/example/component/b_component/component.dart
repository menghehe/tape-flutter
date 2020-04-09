import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class BComponent extends Component<BState> {
  BComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<BState>(
                adapter: null,
                slots: <String, Dependent<BState>>{
                }),);

}
