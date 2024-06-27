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
      productInfo:
          'A stylish table desk lamp perfect for reading and adding a modern touch to your workspace.',
    ),
    ProductModel(
      id: "2",
      title: "Sofa",
      description: "Comfortable Living Room Sofa",
      rating: 4.8,
      price: 500.00,
      isLiked: true,
      firstColorImage: 'lamp',
      productInfo:
          'A luxurious and comfortable sofa that adds elegance to any living room. Upholstered in high-quality fabric, it provides ample seating space.',
    ),
    ProductModel(
      id: "3",
      title: "Coffee Table",
      description: "Modern Coffee Table",
      rating: 4.5,
      price: 200.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'A sleek and modern coffee table with a glass top and sturdy metal frame. Perfect for holding drinks, books, and decorative items.',
    ),
    ProductModel(
      id: "4",
      title: "Dining Table",
      description: "Wooden Dining Table",
      rating: 4.7,
      price: 350.00,
      isLiked: true,
      firstColorImage: 'lamp',
      productInfo:
          'A classic wooden dining table that can comfortably seat six people. Made from high-quality wood, it is durable and stylish.',
    ),
    ProductModel(
      id: "5",
      title: "Chair",
      description: "Ergonomic Office Chair",
      rating: 4.9,
      price: 120.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'An ergonomic office chair designed for maximum comfort during long hours of work. Features adjustable height and lumbar support.',
    ),
    ProductModel(
      id: "6",
      title: "Bookshelf",
      description: "Wooden Bookshelf",
      rating: 4.6,
      price: 220.00,
      isLiked: true,
      firstColorImage: 'lamp',
      productInfo:
          'A spacious wooden bookshelf with multiple shelves for storing books, decorative items, and more. Its sturdy construction ensures durability.',
    ),
    ProductModel(
      id: "7",
      title: "Bed",
      description: "Queen Size Bed",
      rating: 4.8,
      price: 800.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'A comfortable queen size bed with a solid wood frame and a plush mattress. Perfect for a restful night\'s sleep.',
    ),
    ProductModel(
      id: "8",
      title: "Wardrobe",
      description: "Spacious Wardrobe",
      rating: 4.5,
      price: 600.00,
      isLiked: true,
      firstColorImage: 'lamp',
      productInfo:
          'A spacious wardrobe with multiple compartments and hanging space for all your clothing and accessories. Made from high-quality wood.',
    ),
    ProductModel(
      id: "9",
      title: "Nightstand",
      description: "Bedside Nightstand",
      rating: 4.4,
      price: 80.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'A compact bedside nightstand with a drawer and shelf for storing essentials. Its modern design complements any bedroom decor.',
    ),
    ProductModel(
      id: "10",
      title: "TV Stand",
      description: "Modern TV Stand",
      rating: 4.7,
      price: 250.00,
      isLiked: true,
      firstColorImage: 'lamp',
      productInfo:
          'A modern TV stand with ample storage space for media devices and accessories. Features a sleek design and sturdy construction.',
    ),
    ProductModel(
      id: "11",
      title: "Recliner",
      description: "Comfortable Recliner",
      rating: 4.9,
      price: 300.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'A comfortable recliner with adjustable positions and plush padding. Ideal for relaxing and watching TV.',
    ),
  ];

  List get product => [..._product];
}
