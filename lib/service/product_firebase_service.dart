import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_shop_animation/models/product_model.dart';

class ProductFirebaseService {
  final _productCollection = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot> getProduct() async* {
    yield* _productCollection.snapshots();
  }

  void addProduct(ProductModel model) {
    _productCollection.add({
      "title": model.title,
      "description": model.description,
      " rating": model.rating,
      "price": model.price,
      "image": model.price,
      "isLiked": model.price
    });
  }
}
