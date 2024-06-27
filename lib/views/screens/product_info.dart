import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatelessWidget {
  final int index;

  const ProductInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          final product = controller.product[index];
          return ProductDetail(product: product);
        },
      ),
    );
  }
}

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? selectedColorImage;

  @override
  void initState() {
    super.initState();
    selectedColorImage = widget.product.firstColorImage;
  }

  void selectColor(String colorImage) {
    setState(() {
      selectedColorImage = colorImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImage(
          product: widget.product,
          selectedColorImage: selectedColorImage,
        ),
        ColorOptions(
          onSelectColor: selectColor,
        ),
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  final ProductModel product;
  final String? selectedColorImage;

  const ProductImage({
    super.key,
    required this.product,
    required this.selectedColorImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 3,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.asset(
              "assets/images/$selectedColorImage.png",
              key: ValueKey<String>(selectedColorImage!),
              height: size.height / 3,
              width: size.width / 1.5,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 0,
            left: 150,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(color: Color(0xffCCC5AD)),
                  ),
                  Text(
                    product.description,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "Price",
                    style: TextStyle(color: Color(0xffCCC5AD)),
                  ),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorOptions extends StatelessWidget {
  final Function(String) onSelectColor;

  const ColorOptions({
    super.key,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Choose Colors",
            style: TextStyle(color: Color(0xffCCC5AD)),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ColorOption(
                color: Colors.red[200],
                colorImage: 'lamp_red',
                onSelectColor: onSelectColor,
              ),
              const Gap(10),
              ColorOption(
                color: Colors.blue[400],
                colorImage: 'lamp_blue',
                onSelectColor: onSelectColor,
              ),
              const Gap(10),
              ColorOption(
                color: Colors.black,
                colorImage: 'lamp',
                onSelectColor: onSelectColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color? color;
  final String colorImage;
  final Function(String) onSelectColor;

  const ColorOption({
    super.key,
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
