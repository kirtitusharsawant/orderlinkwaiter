import 'package:waiterbookadmin/model/order_item_model.dart';

class OrderModel {
  String? id;
  String? orderNumber;
  String? tableNumber;
  String? createdAt;
  String? total;
  String? paymentStatus;
  List<OrderItem>? items;
  OrderModel({
    this.id,
    this.orderNumber,
    this.tableNumber,
    this.createdAt,
    this.total,
    this.paymentStatus,
    this.items,
  });
}
