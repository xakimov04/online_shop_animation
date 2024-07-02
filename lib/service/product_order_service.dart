import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop_animation/models/product_model.dart';

class ProductOrderService {
  final _orderCollection = FirebaseFirestore.instance.collection("orders");

  Stream<QuerySnapshot> getOrder() async* {
    yield* _orderCollection.snapshots();
  }

  void addOrders(ProductModel model, String doc, String userUid) {
    _orderCollection.doc(userUid).set({
      "id": doc,
      "title": model.title,
      "description": model.description,
      "rating": model.rating,
      "price": model.price,
      "image": model.image,
      "isLiked": model.isLiked
    });
  }
}
