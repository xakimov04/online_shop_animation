import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/screens/cart_screen.dart';
import 'package:online_shop_animation/views/screens/home_screen/room_page.dart';
import 'package:online_shop_animation/views/screens/profile_screen.dart';
import 'package:online_shop_animation/views/widgets/product_count.dart';
import 'package:online_shop_animation/views/widgets/product_grid.dart';
import 'package:online_shop_animation/views/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> _pageViewList = [
    {
      "title": "Living Room",
      "image":
          "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    },
    {
      "title": "Wall Decoration",
      "image":
          "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset("assets/icons/drawer.png"),
        ),
        actions: [
          const Icon(CupertinoIcons.bell),
          const Gap(10),
          const Icon(CupertinoIcons.search),
          const Gap(10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/person.png"),
            ),
          ),
          const Gap(10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff6D8D54),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarousel(),
                const Gap(20),
                _buildCategoryBar(),
                const Gap(10),
                const ProductCount(),
                const Gap(10),
                const ProductGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 175,
      child: CarouselSlider.builder(
        itemCount: _pageViewList.length,
        itemBuilder: (context, index, realIdx) {
          final item = _pageViewList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPage(
                    image: item['image']!,
                    title: item['title']!,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: .8,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            _currentIndexNotifier.value = index;
          },
        ),
      ),
    );
  }

  Widget _buildCategoryBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryBarItem(title: 'Popular', isActive: true),
          CategoryBarItem(title: 'New'),
          CategoryBarItem(title: 'Best Selling'),
          CategoryBarItem(title: 'Featured'),
        ],
      ),
    );
  }
}

class CategoryBarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const CategoryBarItem({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? Colors.green : Colors.grey,
      ),
    );
  }
}
