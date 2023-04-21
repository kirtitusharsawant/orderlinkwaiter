// class User {
//   String? id;
//   String? name;
//   String? phoneNumber;
//   String? hotelId;
//   String? role;
//   User(
//     this.id,
//     this.name,
//     this.phoneNumber,
//     this.hotelId,
//     this.role,
//   );
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? number;
  String? id;

  UserModel({
    this.number,
    this.id,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    number = documentSnapshot["number"];
  }
}
