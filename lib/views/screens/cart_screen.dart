import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/order_model.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid');
      name = prefs.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart product",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: uid == null
          ? const Center(child: CircularProgressIndicator())
          : Consumer<ProductController>(
              builder: (context, productController, child) {
                return StreamBuilder<List<OrderModel>>(
                  stream: productController.orderStream,
                  builder: (context, streamSnapshot) {
                    print(streamSnapshot);
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!streamSnapshot.hasData ||
                        streamSnapshot.data!.isEmpty) {
                      return const Center(child: Text('No products available'));
                    }

                    final orders = streamSnapshot.data!;
                    final userOrders =
                        orders.where((order) => order == uid).toList();

                    if (userOrders.isEmpty) {
                      return const Center(child: Text('No products in cart'));
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.60,
                      ),
                      itemCount: userOrders.length,
                      itemBuilder: (context, index) {
                        final product = userOrders[index];
                        // return ChangeNotifierProvider<ProductModel>.value(
                        //   value: product.hashCode,
                        //   child: ProductItem(
                        //     index: index,
                        //   ),
                        // );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
