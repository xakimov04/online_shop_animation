import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? uid;
  String? name;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid');
      name = prefs.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart product"),
      ),
      body: Consumer<ProductController>(
        builder: (context, productController, child) {
          return StreamBuilder<List<ProductModel>>(
            stream: productController.orderStream,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products available'));
              }

              final products =
                  snapshot.data!.where((product) => product.id == uid).toList();
              if (products.isEmpty) {
                return const Center(child: Text('No products available'));
              }

              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.60,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider<ProductModel>.value(
                    value: products[index],
                    child: ProductItem(index: index),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
