import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:tape/models/base_page.dart';
import 'package:tape/models/clip.dart';

@JsonSerializable()
class ClipPage extends BasePage{
  List<Clip> records;
}