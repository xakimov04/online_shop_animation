import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/screens/home_screen/product_info.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({Key? key, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);

    void addToCart() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userUid = prefs.getString('uid') ?? '';
      ProductController controller =
          Provider.of<ProductController>(context, listen: false);
      controller.addOrder(product, userUid, userUid);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to Cart')),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductInfo(index: index),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Image.network(
                        product.image[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        product.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                                size: 17,
                              ),
                              Text(
                                "(${product.rating.toString()})",
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          GestureDetector(
                            onTap: addToCart,
                            child: const Icon(
                              CupertinoIcons.cart_badge_plus,
                              color: Color(0xffCCC5AD),
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
