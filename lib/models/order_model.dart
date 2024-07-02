import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String productUid;

  OrderModel({
    required this.productUid,
  });
  factory OrderModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      productUid: data["productUid"],
    );
  }
}
