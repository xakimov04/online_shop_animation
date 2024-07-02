import 'package:flutter/material.dart';
import 'package:online_shop_animation/models/order_model.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/service/product_firebase_service.dart';
import 'package:online_shop_animation/service/product_order_service.dart';

class ProductController extends ChangeNotifier {
  final ProductFirebaseService _productFirebaseService =
      ProductFirebaseService();
  final ProductOrderService _orderService = ProductOrderService();

  List<ProductModel> _products = [];
  List<ProductModel> get products => List.unmodifiable(_products);

  List<ProductModel> _order = [];
  List<ProductModel> get order => List.unmodifiable(_order);

  ProductController() {
    _init();
  }

  void _init() {
    _productFirebaseService.getProduct().listen((snapshot) {
      _products =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      _orderService.getOrder().listen(
        (snapshorOrder) {
          _order = snapshorOrder.docs
              .map((e) => ProductModel.fromSnapshot(e))
              .toList();
        },
      );
      notifyListeners();
    });
  }

  Stream<List<ProductModel>> get productStream =>
      _productFirebaseService.getProduct().map((snapshot) =>
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList());

  Stream<List<ProductModel>> get orderStream =>
      _orderService.getOrder().map((snapshot) =>
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList());

  void addOrder(ProductModel producModel, String userUid, String doc) {
    _orderService.addOrders(producModel, userUid, doc);
  }
}
