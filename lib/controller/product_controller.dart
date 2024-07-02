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

  final List<OrderModel> _order = [];
  List<OrderModel> get order => List.unmodifiable(_order);

  ProductController() {
    _init();
  }

  void _init() {
    _productFirebaseService.getProduct().listen((snapshot) {
      _products =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Stream<List<ProductModel>> get productStream =>
      _productFirebaseService.getProduct().map((snapshot) =>
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList());

  Stream<List<OrderModel>> get orderStream =>
      _orderService.getOrder().map((snapshot) =>
          snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList());

  void addOrder(String productUid, String userUid) {
    _orderService.addOrders(productUid, userUid);
  }
}
