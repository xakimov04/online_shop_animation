import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrderService {
  final _orderCollection = FirebaseFirestore.instance.collection("orders");

  Stream<QuerySnapshot> getOrder() async* {
    yield* _orderCollection.snapshots();
  }

  void addOrders(String productUid, String userUid) {
    _orderCollection.doc(userUid).set({
      "productUid": productUid,
    });
  }
}
