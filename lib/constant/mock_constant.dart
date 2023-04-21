import 'package:waiterbookadmin/model/category_model.dart';
import 'package:waiterbookadmin/model/item_model.dart';

List<Category> categoryList = [
  Category(name: 'Starter'),
  Category(name: 'NonVeg'),
  Category(name: 'Veg'),
  Category(name: 'Rotis'),
  Category(name: 'Other'),
];

List<Item> orderItemList = [
  Item(
    id: "1",
    itemName: "Panner Kadhai",
    itemPrice: "200",
    itemCategory: "3",
    itemStatus: true,
    createdAt: "22nd June 2020",
    quantity: 0,
  ),
  Item(
    id: "2",
    itemName: "Panner Kadhai",
    itemPrice: "200",
    itemCategory: "3",
    itemStatus: true,
    createdAt: "22nd June 2020",
    quantity: 0,
  ),
  Item(
    id: "3",
    itemName: "Panner Kadhai",
    itemPrice: "200",
    itemCategory: "3",
    itemStatus: true,
    createdAt: "22nd June 2020",
    quantity: 0,
  ),
  Item(
    id: "4",
    itemName: "Panner Kadhai",
    itemPrice: "200",
    itemCategory: "3",
    itemStatus: true,
    createdAt: "22nd June 2020",
    quantity: 0,
  ),
];

// List<Order> pastOrderItemList = [
//   Order("1", "12345", "23", "20th Aug 2022", "1499", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ]),
//   Order("1", "12345", "23", "19th Aug 2022", "1499", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ]),
//   Order("1", "12345", "23", "18th Aug 2022", "2000", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ]),
//   Order("1", "12345", "23", "20th Aug 2022", "1499", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ]),
//   Order("1", "12345", "23", "20th Aug 2022", "1499", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ]),
//   Order("1", "12345", "23", "20th Aug 2022", "1499", "Paid", [
//     OrderItem("1", "Paneer Kadhai", "200", "Veg", true, "1"),
//     OrderItem("2", "Roti", "20", "Veg", true, "9"),
//     OrderItem("3", "Chicken Masala", "200", "NonVeg", true, "1"),
//     OrderItem("4", "Mutton Handi", "400", "NonVeg", true, "2"),
//   ])
// ];
