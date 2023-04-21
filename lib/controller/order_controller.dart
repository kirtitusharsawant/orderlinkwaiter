import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/constant/firebase_constant.dart';
import 'package:waiterbookadmin/model/category_model.dart';
import 'package:waiterbookadmin/model/get_order_model.dart';
import 'package:waiterbookadmin/model/item_model.dart';
import 'package:waiterbookadmin/model/order_item_model.dart';
import 'package:waiterbookadmin/model/table_model.dart';
import 'package:waiterbookadmin/screen/no_internet_screen/no_internet_screen.dart';
import 'package:waiterbookadmin/widgets/snack_bar.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  var isLoading = false.obs;

  // READ TABLE START HERE

  final searchTableList = List<TableModel>.empty(growable: true).obs;

  searchTableListFunction(String search) {
    if (search == "") {
      searchTableList.value = tablelist;
    } else {
      searchTableList.value = tablelist
          .where(
              (p) => p.tableNumber.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  final tablelist = List<TableModel>.empty(growable: true).obs;

  callTables(String hotelId) {
    tablelist.bindStream(listtables(hotelId));
  }

  Stream<List<TableModel>> listtables(String hotelId) {
    Stream<QuerySnapshot> stream = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId.trim().toString())
        .collection('tables')
        .where('isActive', isEqualTo: true)
        .where('isEmpty', isEqualTo: true)
        .orderBy('tableNumber', descending: false)
        .snapshots();

    return stream.map((qShot) => qShot.docs
        .map(
          (doc) => TableModel(
              id: doc['id'],
              isEmpty: doc['isEmpty'],
              tableNumber: doc['tableNumber'],
              isActive: doc['isActive']),
        )
        .toList());
  }
  // READ TABLES ENDS HERE

  // GET CATEGORIES START HERE
  final categorylist = List<Category>.empty(growable: true).obs;

  callCategories(String hotelId) async {
    categorylist.bindStream(listcategories(hotelId));
  }

  Stream<List<Category>> listcategories(String hotelId) {
    Stream<QuerySnapshot> stream = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId.trim().toString())
        .collection('categories')
        .orderBy("name", descending: false)
        .snapshots();

    return stream.map((qShot) => qShot.docs
        .map(
          (doc) => Category(
            name: doc['name'],
          ),
        )
        .toList());
  }
  // GET CATEGORIES END HERE

  // READ ITEMS START HERE
  final itemlist = List<Item>.empty(growable: true).obs;

  getItems(String hotelId) async {
    try {
      isLoading(true);
      itemlist.clear();
      firebaseFirestore
          .collection('restaurants')
          .doc(hotelId.trim().toString())
          .collection('items')
          .get()
          .then((QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          itemlist.add(Item(
            id: element['id'],
            createdAt: element['createdat'],
            itemCategory: element['category'],
            itemName: element['name'],
            itemPrice: element['price'],
            itemStatus: element['status'],
            quantity: element['quantity'],
          ));
        }
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
      filterItems("All");
      update();
    }
  }
  // READ ITEMS ENDS HERE

  // FILTERED LIST START HERE
  final filteredItemlist = List<Item>.empty(growable: true).obs;

  filterItems(String categoryName) {
    isLoading(true);
    List<Item> results = [];
    if (cartItemlist.isEmpty) {
      if (categoryName == "All") {
        results = itemlist;
      } else {
        results = itemlist.where((element) {
          return element.itemCategory
              .toString()
              .toLowerCase()
              .contains(categoryName.toLowerCase());
        }).toList();
      }
      filteredItemlist.value = results;
      update();
    } else {
      if (categoryName == "All") {
        cartItemlist.every((element) => itemlist.contains(element));
        results = itemlist;
      } else {
        results = itemlist.where((element) {
          return element.itemCategory
              .toString()
              .toLowerCase()
              .contains(categoryName.toLowerCase());
        }).toList();
      }
      filteredItemlist.value = results;
      update();
    }

    isLoading(false);
  }
  // FILTERED LIST END HERE

  // CART ITEM LIST START HERE
  final cartItemlist = List<OrderItem>.empty(growable: true).obs;

  var total = 0.0.obs;

  Future<bool> checkIfItemExist(Item item) async =>
      cartItemlist.where((element) => element.id == item.id).isNotEmpty;

  addItemToCart(Item item) async {
    bool isPresent = await checkIfItemExist(item);
    if (isPresent) {
      int index = cartItemlist.indexWhere((element) => element.id == item.id);
      cartItemlist[index].quantity =
          int.parse(cartItemlist[index].quantity.toString()) + 1;
      double? finalCost = (cartItemlist[index].quantity ?? 1) *
          double.parse(cartItemlist[index].itemPrice.toString());
      cartItemlist[index].cost = finalCost;
    } else {
      cartItemlist.add(OrderItem(
        item.id,
        item.itemName,
        double.parse(item.itemPrice.toString()),
        item.itemCategory,
        item.itemStatus,
        item.quantity,
        1 * double.parse(item.itemPrice.toString()),
      ));
    }
  }

  removeItemFromCart(Item item) async {
    bool isPresent = await checkIfItemExist(item);
    if (isPresent) {
      int index = cartItemlist.indexWhere((element) => element.id == item.id);

      if (cartItemlist[index].quantity == 1) {
        cartItemlist.removeWhere((element) => element.id == item.id);
      } else {
        cartItemlist[index].quantity =
            int.parse(cartItemlist[index].quantity.toString()) - 1;
        double? finalCost = (cartItemlist[index].quantity ?? 1) *
            double.parse(cartItemlist[index].itemPrice.toString());
        cartItemlist[index].cost = finalCost;
      }
    }
  }

  addTotal() {
    total(0.0);
    cartItemlist.forEach((element) {
      total.value = element.cost! + total.value;
    });
  }

  // CART ITEM LIST END HERE

  // GET ORDER NUMBER START HERE

  var newOrderNumber = 0.obs;

  getOrderNumber() async {
    String? hotelId = await sharedPreferenceController.getHotelId();
    DocumentReference documentReference = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId!.trim().toString());
    DocumentSnapshot docSnapshot = await documentReference.get();
    int orderNumber = int.parse(docSnapshot.get("total_orders").toString());
    int? newOrderNo = orderNumber + 1;
    newOrderNumber.value = newOrderNo;
  }
  // GET ORDER NUMBER ENDS HERE

  // ADD ORDER NUMBER START HERE
  addOrderNumber(String orderNumber) async {
    String? hotelId = await sharedPreferenceController.getHotelId();
    DocumentReference documentReference = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId!.trim().toString());
    documentReference.update({
      "total_orders": orderNumber,
    });
  }
  // ADD ORDER NUMBER ENDS HERE

  // PLACE ORDER START HERE
  var currentDocId = "".obs;
  void addOrder(String tableNumber, String tableID) async {
    try {
      isLoading(true);
      await getOrderNumber();
      String? hotelId = await sharedPreferenceController.getHotelId();
      DocumentReference documentReference = firebaseFirestore
          .collection('restaurants')
          .doc(hotelId!.trim().toString())
          .collection('orders')
          .doc();
      currentDocId.value = documentReference.id;
      documentReference
          .set({
            "id": documentReference.id,
            "orderNumber": newOrderNumber.value.toString(),
            "tableNumber": tableNumber.trim().toString(),
            "payment_status": 0,
            "orderTotal": total.value.toString(),
            "created_at":
                DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
            "tableId": tableID.toString(),
          })
          .then((value) {})
          .catchError((error) {
            print("This is error $error");
            isLoading(false);
            showAppSnackBar(
              message: "Error Adding Order",
              toastType: ToastType.error,
            );
          });
    } finally {
      String? hotelIdItem = await sharedPreferenceController.getHotelId();
      addItemsToOrder(currentDocId.value.toString(), hotelIdItem!);
      updateTableStatus(false, hotelIdItem, tableID);
      addOrderNumber(newOrderNumber.value.toString());
      cartItemlist.clear();
    }
  }
  // PLACE ORDER END HERE

  addItemsToOrder(String docId, String hotelId) {
    try {
      for (var element in cartItemlist) {
        DocumentReference documentReference = firebaseFirestore
            .collection('restaurants')
            .doc(hotelId.trim().toString())
            .collection('orders')
            .doc(docId);
        documentReference.update({
          "items": FieldValue.arrayUnion([
            {
              "id": element.id.toString(),
              "itemName": element.itemName.toString(),
              "itemPrice": element.itemPrice.toString(),
              "itemCategory": element.itemCategory.toString(),
              "itemStatus": element.itemStatus.toString(),
              "quantity": element.quantity.toString(),
              "cost": element.cost.toString(),
            }
          ]),
        });
      }
    } catch (e) {
      showAppSnackBar(
        message: "Error adding items in order",
        toastType: ToastType.error,
      );
    } finally {
      isLoading(false);
      showAppSnackBar(
        message: "Items added successfully in order",
        toastType: ToastType.success,
      );
      filteredItemlist.clear();
      filterItems("All");
      Get.offAll(const NoInternetScreen());
    }
  }

  clearCartItemList() {
    cartItemlist.clear();
  }

  addItemsToCartList(GetOrderModel orderModel) async {
    for (var element in orderModel.items) {
      final Map<String, dynamic> json = {
        "itemName": element['itemName'],
        "quantity": int.parse(element['quantity'].toString()),
        "cost": element['cost'],
        "itemCategory": element['itemCategory'],
        "itemStatus": true,
        "itemPrice": element['itemPrice'],
        "id": element['id'],
      };
      await addItemToCart(Item(
        id: json["id"],
        itemName: json["itemName"],
        itemPrice: json["itemPrice"],
        itemCategory: json["itemCategory"],
        itemStatus: json["itemStatus"],
        createdAt: json["createdAt"] ?? DateTime.now().toString(),
        quantity: json["quantity"],
      ));
    }
  }

  //ADD ITEM TO EXISTING ORDER
  addReorder(GetOrderModel orderModel) async {
    await addItemsToCartList(orderModel);
    await addTotal();
  }

  updateItemToExistingOrder(String docId, BuildContext context) async {
    try {
      String? hotelId = await sharedPreferenceController.getHotelId();
      await clearOrderItemList(docId.toString());
      await addUpdatedTotal(docId.toString());
      for (var element in cartItemlist) {
        DocumentReference documentReference = firebaseFirestore
            .collection('restaurants')
            .doc(hotelId!.trim().toString())
            .collection('orders')
            .doc(docId);
        documentReference.update({
          "items": FieldValue.arrayUnion([
            {
              "id": element.id.toString(),
              "itemName": element.itemName.toString(),
              "itemPrice": element.itemPrice.toString(),
              "itemCategory": element.itemCategory.toString(),
              "itemStatus": element.itemStatus.toString(),
              "quantity": element.quantity.toString(),
              "cost": element.cost.toString(),
            }
          ]),
        });
      }
    } catch (e) {
      showAppSnackBar(
        message: "Error adding items in reorder",
        toastType: ToastType.error,
      );
    } finally {
      isLoading(false);
      showAppSnackBar(
        message: "Items added successfully in reorder",
        toastType: ToastType.success,
      );
      filteredItemlist.clear();
      filterItems("All");
      // Get.offAll(const NoInternetScreen());
      // Get.back();
      // Get.back();
      // OrderSuccessDailog().orderSuccessDailog(context);
    }
  }

  clearOrderItemList(String docId) async {
    String? hotelId = await sharedPreferenceController.getHotelId();
    DocumentReference documentReference = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId!.trim().toString())
        .collection('orders')
        .doc(docId);
    documentReference.update({
      "items": [],
    });
  }

  addUpdatedTotal(String docId) async {
    String? hotelId = await sharedPreferenceController.getHotelId();
    DocumentReference documentReference = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId!.trim().toString())
        .collection('orders')
        .doc(docId);
    documentReference.update({
      "orderTotal": total.value.toString(),
    });
  }

  // READ TABLE START HERE
  final searchUnpaidList = List<GetOrderModel>.empty(growable: true).obs;

  searchUnpaidListFunction(String search) {
    if (search == "") {
      searchUnpaidList.value = unpaidlist;
    } else {
      searchUnpaidList.value = unpaidlist
          .where(
              (p) => p.tableNumber.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  final unpaidlist = List<GetOrderModel>.empty(growable: true).obs;

  callUnpaidList(String hotelId) {
    unpaidlist.bindStream(listunPaidOrders(hotelId));
  }

  Stream<List<GetOrderModel>> listunPaidOrders(String hotelId) {
    Stream<QuerySnapshot> stream = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId.trim().toString())
        .collection('orders')
        .where('payment_status', isEqualTo: 0)
        .snapshots();

    return stream.map((qShot) => qShot.docs.map(
          (doc) {
            return GetOrderModel(
              id: doc['id'],
              tableNumber: doc['tableNumber'],
              createdAt: doc['created_at'],
              items: doc['items'],
              orderNumber: doc['orderNumber'],
              orderTotal: doc['orderTotal'],
              paymentStatus: doc['payment_status'],
              tableId: doc['tableId'],
            );
          },
        ).toList());
  }
  // READ TABLES ENDS HERE

  // READ TABLE START HERE
  final paidlist = List<GetOrderModel>.empty(growable: true).obs;

  callPaidList(String hotelId) {
    paidlist.bindStream(listPaidOrders(hotelId));
  }

  Stream<List<GetOrderModel>> listPaidOrders(String hotelId) {
    Stream<QuerySnapshot> stream = firebaseFirestore
        .collection('restaurants')
        .doc(hotelId.trim().toString())
        .collection('orders')
        .where('payment_status', isEqualTo: 1)
        .snapshots();

    return stream.map((qShot) => qShot.docs.map(
          (doc) {
            return GetOrderModel(
              id: doc['id'],
              tableNumber: doc['tableNumber'],
              createdAt: doc['created_at'],
              items: doc['items'],
              orderNumber: doc['orderNumber'],
              orderTotal: doc['orderTotal'],
              paymentStatus: doc['payment_status'],
              tableId: doc['tableId'],
            );
          },
        ).toList());
  }
  // READ TABLES ENDS HERE

  //BOOK / UNBOOK TABLE START HERE

  updateTableStatus(bool isEmpty, String hotelId, String docId) async {
    try {
      DocumentReference documentReference = firebaseFirestore
          .collection('restaurants')
          .doc(hotelId.trim().toString())
          .collection('tables')
          .doc(docId);
      documentReference.update({
        "isEmpty": isEmpty,
      });
    } catch (e) {
      showAppSnackBar(
        message: "Error Updating Table",
        toastType: ToastType.error,
      );
    } finally {
      isLoading(false);
      showAppSnackBar(
        message: "Order Added Successfully",
        toastType: ToastType.success,
      );
    }
  }

  //BOOK / UNBOOK  TABLE END HERE

  //ORDER PAID START HERE

  updateOrderStatus(String hotelId, String docId, String tableID) async {
    try {
      DocumentReference documentReference = firebaseFirestore
          .collection('restaurants')
          .doc(hotelId.trim().toString())
          .collection('orders')
          .doc(docId);
      documentReference.update({
        "payment_status": 1,
      });
    } catch (e) {
      showAppSnackBar(
        message: "Error Updating Payment Status",
        toastType: ToastType.error,
      );
    } finally {
      isLoading(false);
      showAppSnackBar(
        message: "Payment status updated Successfully",
        toastType: ToastType.success,
      );
      updateTableStatus(true, hotelId, tableID);
    }
  }

  //ORDER PAID END HERE
}
