import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/page/home_page/clip_cover_component/state.dart';

class HomeState implements Cloneable<HomeState> ,MutableSource{

  @override
  HomeState clone() {
    return HomeState()
    ..refreshController = refreshController
    ..clipCoverStateList =clipCoverStateList
    ..clipParam = clipParam
    ..mark = mark;
  }


  List<ClipCoverState> clipCoverStateList;
  Clip clipParam;
  int mark = 0;

  @override
  int get itemCount {
    return clipCoverStateList?.length ??0;
  }

  @override
  String getItemType(int index) {
    return "clipCover";
  }

  @override
  Object getItemData(int index) {
    return clipCoverStateList[index];
  }

  @override
  void setItemData(int index, Object data) {
    clipCoverStateList[index] = data;
  }

  @override
  MutableSource updateItemData(int index, Object data, bool isStateCopied) {
    // TODO: implement updateItemData
    return null;
  }


  RefreshController refreshController;


}

HomeState initState(Map<String, dynamic> args) {
  Clip clipParam = Clip();
  OrderItem orderItem = OrderItem("create_time", false);
  clipParam.orders = [orderItem];
  clipParam.current = 1;
  clipParam.size = 4;
  return HomeState()
      ..refreshController = new RefreshController()
      ..clipParam = clipParam;
}


