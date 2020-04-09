import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class AComponent extends Component<AState> {
  AComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<AState>(
                adapter: null,
                slots: <String, Dependent<AState>>{
                }),);

}
