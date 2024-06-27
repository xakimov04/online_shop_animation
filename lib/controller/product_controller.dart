import 'package:flutter/material.dart';
import 'package:online_shop_animation/models/product_model.dart';

class ProductController extends ChangeNotifier {
  final List<ProductModel> _product = [
    ProductModel(
      id: "1",
      title: "Lamp",
      description: "Table Desk Lamp",
      rating: 5.0,
      price: 142.00,
      isLiked: false,
      firstColorImage: 'lamp',
      secondColorImage: 'lamp',
      thirdColorImage: 'lamp',
    ),
    ProductModel(
      id: "2",
      title: "Lamp",
      description: "Table Desk Lamp",
      rating: 5.0,
      price: 142.00,
      isLiked: false,
      firstColorImage: 'lamp',
      secondColorImage: 'lamp',
      thirdColorImage: 'lamp',
    ),
    ProductModel(
      id: "3",
      title: "Lamp",
      description: "Table Desk Lamp",
      rating: 5.0,
      price: 142.00,
      isLiked: false,
      firstColorImage: 'lamp',
      secondColorImage: 'lamp',
      thirdColorImage: 'lamp',
    ),
    ProductModel(
      id: "4",
      title: "Lamp",
      description: "Table Desk Lamp",
      rating: 5.0,
      price: 142.00,
      isLiked: false,
      firstColorImage: 'lamp',
      secondColorImage: 'lamp',
      thirdColorImage: 'lamp',
    )
  ];

  List get product => [..._product];
}
