import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  String id;
  String title;
  String description;
  int rating;
  int price;
  List<dynamic> image;
  bool isLiked;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.image,
    required this.isLiked,
  });

  factory ProductModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      rating: data['rating'],
      price: data['price'],
      image: List<dynamic>.from(data['image']),
      isLiked: data['isLiked'],
    );
  }
}
