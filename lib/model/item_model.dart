import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String itemName;
  String itemPrice;
  String itemCategory;
  bool itemStatus; // 0 is available and 1 is not available
  String createdAt;
  int quantity;

  Item({
    required this.id,
    required this.itemName,
    required this.itemPrice,
    required this.itemCategory,
    required this.itemStatus,
    required this.createdAt,
    required this.quantity,
  });

  // factory Item.fromDocument(DocumentSnapshot doc) {
  //   return Item(
  //     id: doc.data().toString().contains('id') ? doc.get('id') : '', //String
  //     itemName: doc.data().toString().contains('name') ? doc.get('name') : '',
  //     createdAt: doc.data().toString().contains('createdat')
  //         ? doc.get('createdat')
  //         : '',
  //     itemCategory:
  //         doc.data().toString().contains('category') ? doc.get('category') : '',
  //     itemPrice:
  //         doc.data().toString().contains('price') ? doc.get('price') : '',
  //     itemStatus:
  //         doc.data().toString().contains('status') ? doc.get('status') : '',
  //     quantity:
  //         doc.data().toString().contains('quantity') ? doc.get('quantity') : '',
  //   );
  // }

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      itemName: map['name'] ?? '',
      createdAt: map['createdat'] ?? '',
      itemCategory: map['category'] ?? '',
      itemPrice: map['price'] ?? '',
      itemStatus: map['status'] ?? '',
      quantity: map['quantity'] ?? 1,
    );
  }
}
