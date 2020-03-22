import 'package:dart_json_mapper/dart_json_mapper.dart';

@JsonSerializable()
class Base{
   DateTime createTime;
   int createMan;
   DateTime updateTime;
   int updateMan;
   int current;
   int size;
}