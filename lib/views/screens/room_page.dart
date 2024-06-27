import 'package:flutter/material.dart';
import 'package:online_shop_animation/views/widgets/product_count.dart';
import 'package:online_shop_animation/views/widgets/product_grid.dart';

class RoomPage extends StatelessWidget {
  final String image;
  final String title;

  const RoomPage({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            toolbarHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff6D8D54),
            onPressed: () {},
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          body: const Column(
            children: [
              SizedBox(
                height: 60,
                child: ProductCount(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 5,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
