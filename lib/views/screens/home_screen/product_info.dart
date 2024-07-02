import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductInfo extends StatelessWidget {
  final int index;

  const ProductInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          final product = controller.products[index];
          return _ProductDetail(product: product);
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Animate()
            .custom(
              duration: 500.milliseconds,
              begin: 10,
              end: 0,
              builder: (_, value, __) => Container(
                width: 270,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff6D8D54),
                ),
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            .slideY(begin: 0.20, end: 0.0)
            .fadeIn(),
        const Gap(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Animate()
                .custom(
                  duration: 500.milliseconds,
                  begin: 10,
                  end: 0,
                  builder: (_, value, __) => const Icon(
                    CupertinoIcons.heart_circle_fill,
                    color: Color(0xffCCC5AD),
                    size: 55,
                  ),
                )
                .slideY(begin: 0.20, end: 0.0)
                .fadeIn(),
            const Gap(10),
            FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff6D8D54),
              onPressed: () {},
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductDetail extends StatefulWidget {
  final ProductModel product;

  const _ProductDetail({super.key, required this.product});

  @override
  State<_ProductDetail> createState() => __ProductDetailState();
}

class __ProductDetailState extends State<_ProductDetail> {
  int? selectedColorImage;

  @override
  void initState() {
    super.initState();
    selectedColorImage = 0;
  }

  void selectColor(int imageIndex) {
    setState(() {
      selectedColorImage = imageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              )),
              child: _ProductImage(
                product: widget.product,
                selectedColorImage: selectedColorImage,
                onSelectColor: selectColor,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildProductInfo(),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Animate()
        .custom(
          duration: 500.milliseconds,
          begin: 10,
          end: 0,
          builder: (_, value, __) => Column(
            children: [
              _ColorOptions(onSelectColor: selectColor),
              const Gap(10),
              _buildPriceRow(),
              const Gap(10),
              _buildRatingRow(),
              const Gap(10),
              const Gap(10),
              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        )
        .slideY(begin: 0.20, end: 0.0)
        .fadeIn();
  }

  Widget _buildRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rate_rounded,
              color: Colors.amber,
            ),
          )..add(
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "${widget.product.rating}",
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Text(
                "124 reviews",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Price",
          style: TextStyle(color: Color(0xffCCC5AD), fontSize: 20),
        ),
        Text(
          "\$${widget.product.price}",
          style: const TextStyle(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  final ProductModel product;
  final int? selectedColorImage;
  final Function(int) onSelectColor;

  const _ProductImage({
    required this.product,
    required this.selectedColorImage,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: _buildProductImage(size),
    );
  }

  Widget _buildProductImage(Size size) {
    return Animate()
        .custom(
          duration: 500.milliseconds,
          begin: 10,
          end: 0,
          builder: (_, value, __) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.network(
              product.image[selectedColorImage ?? 0],
              key: ValueKey<int>(selectedColorImage ?? 0),
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      width: size.width,
                      height: size.height,
                      color: Colors.grey[400],
                    ),
                  );
                }
              },
            ),
          ),
        )
        .slideX(begin: -0.10, end: 0.0)
        .fadeIn();
  }
}

class _ColorOptions extends StatelessWidget {
  final Function(int) onSelectColor;

  const _ColorOptions({
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose Colors",
          style: TextStyle(color: Color(0xffCCC5AD)),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ColorOption(
              color: Colors.red[200],
              colorImage: 2,
              onSelectColor: onSelectColor,
            ),
            const Gap(10),
            _ColorOption(
              color: Colors.blue[400],
              colorImage: 1,
              onSelectColor: onSelectColor,
            ),
            const Gap(10),
            _ColorOption(
              color: Colors.black,
              colorImage: 0,
              onSelectColor: onSelectColor,
            ),
          ],
        ),
      ],
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color? color;
  final int colorImage;
  final Function(int) onSelectColor;

  const _ColorOption({
    required this.color,
    required this.colorImage,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectColor(colorImage),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
