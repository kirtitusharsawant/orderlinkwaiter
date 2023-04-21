// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

GetOrderModel getOrderModelFromJson(String str) =>
    GetOrderModel.fromJson(json.decode(str));

String getOrderModelToJson(GetOrderModel data) => json.encode(data.toJson());

class GetOrderModel {
  GetOrderModel({
    required this.orderNumber,
    required this.paymentStatus,
    required this.createdAt,
    required this.id,
    required this.items,
    required this.tableNumber,
    required this.orderTotal,
    required this.tableId,
  });

  String orderNumber;
  int paymentStatus;
  String createdAt;
  String id;
  List<dynamic> items;
  String tableNumber;
  String orderTotal;
  String tableId;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
      orderNumber: json["orderNumber"],
      paymentStatus: json["payment_status"],
      createdAt: json["created_at"],
      id: json["id"],
      items: List<dynamic>.from(
          json["items"].map<dynamic>((x) => GetItem.fromJson(x))),
      tableNumber: json["tableNumber"],
      orderTotal: json["orderTotal"],
      tableId: json['tableId']);

  Map<String, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "payment_status": paymentStatus,
        "created_at": createdAt,
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "tableNumber": tableNumber,
        "orderTotal": orderTotal,
        "tableId": tableId,
      };
}

class GetItem {
  GetItem({
    required this.itemName,
    required this.quantity,
    required this.cost,
    required this.itemCategory,
    required this.itemStatus,
    required this.itemPrice,
    required this.id,
  });

  String itemName;
  String quantity;
  String cost;
  String itemCategory;
  String itemStatus;
  String itemPrice;
  String id;

  factory GetItem.fromJson(Map<String, dynamic> json) => GetItem(
        itemName: json["itemName"],
        quantity: json["quantity"],
        cost: json["cost"],
        itemCategory: json["itemCategory"],
        itemStatus: json["itemStatus"],
        itemPrice: json["itemPrice"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "quantity": quantity,
        "cost": cost,
        "itemCategory": itemCategory,
        "itemStatus": itemStatus,
        "itemPrice": itemPrice,
        "id": id,
      };
}
