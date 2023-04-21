class OrderItem {
  String? id;
  String? itemName;
  double? itemPrice;
  String? itemCategory;
  bool? itemStatus;
  int? quantity;
  double? cost;
  OrderItem(
    this.id,
    this.itemName,
    this.itemPrice,
    this.itemCategory,
    this.itemStatus,
    this.quantity,
    this.cost,
  );
}
