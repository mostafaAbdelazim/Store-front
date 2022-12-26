import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/data/dummy_data.dart';
import 'package:task/widgets/category_card.dart';
import 'package:task/widgets/product_card.dart';
import 'package:task/widgets/promo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: kPrimaryColor,
              ),
              Positioned(
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                    // borderRadius: BorderRadius.circular(360)
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
              ),
            ],
          ),
        ),
        title: const Text(
          'الرئيسية',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kAccentColor),
                          borderRadius: BorderRadius.circular(6)),
                      child: const TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'بحث',
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kAccentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16)),
                    onPressed: () {},
                    child: Image.asset(
                      'assets/images/vertical_sliders.png',
                      color: Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    PromoCard(productModel: products[index]),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'الآقسام',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    Text(
                      'عرض المزيد',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    CategoryCard(categoryModel: categories[index]),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'منتجات تهمك',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    Text(
                      'عرض المزيد',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    ProductCard(productModel: products[index]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: kInactiveIconColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'الاقسام',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'طلباتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'صفحتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}
