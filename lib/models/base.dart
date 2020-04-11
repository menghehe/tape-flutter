import 'package:dart_json_mapper/dart_json_mapper.dart';

@JsonSerializable()
class Base{
   DateTime createTime;
   int createMan;
   DateTime updateTime;
   int updateMan;
   int current;
   int size;
   List<OrderItem> orders;
}

@JsonSerializable()
class BasePage{
   int total;
   int size;
   int current;

}

@JsonSerializable()
class OrderItem{
   String column;
   bool asc;

   @JsonProperty(ignore: true)
   OrderItem(this.column, this.asc);

}
@JsonSerializable()
class OrderItemList{
   List<OrderItem> data;

   @JsonProperty(ignore: true)
   OrderItemList(this.data);

}
