import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/constants.dart';
import 'package:task/screens/homeScreen/home_bloc.dart';
import 'package:task/widgets/category_card.dart';
import 'package:task/widgets/loading_indicator.dart';
import 'package:task/widgets/product_card.dart';
import 'package:task/widgets/promo_card.dart';
import 'package:task/widgets/search_bar.dart';
import 'package:task/widgets/show_more_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchProductsEvent());
    context.read<HomeBloc>().add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(right: kPaddingMedium),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: kPrimaryColor,
                ),
                Positioned(
                  top: kPaddingSmall,
                  child: Container(
                    padding: const EdgeInsets.all(kPaddingSmall),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Text('2',
                        style: TextStyle(fontSize: kFontSizeXSmall)),
                  ),
                ),
              ],
            ),
          ),
          title:
              const Text('الرئيسية', style: TextStyle(color: kPrimaryColor))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(),
            SizedBox(
              height: 200,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (old, current) =>
                    old != current && current is ProductsReadyState,
                builder: (context, state) {
                  if (state is ProductsReadyState) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingNormal),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          PromoCard(productModel: state.products[index]),
                    );
                  }
                  return const LoadingIndicator();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kPaddingNormal, horizontal: kPaddingLarge),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'الآقسام',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    ShowMoreText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (old, current) =>
                    old != current && current is CategoriesReadyState,
                builder: (context, state) {
                  if (state is CategoriesReadyState) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingNormal),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) =>
                          CategoryCard(categoryModel: state.categories[index]),
                    );
                  }
                  return const LoadingIndicator();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kPaddingNormal, horizontal: kPaddingLarge),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'منتجات تهمك',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    ShowMoreText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (old, current) =>
                    old != current && current is ProductsReadyState,
                builder: (context, state) {
                  if (state is ProductsReadyState) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingNormal),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          ProductCard(productModel: state.products[index]),
                    );
                  }
                  return const LoadingIndicator();
                },
              ),
            ),
            const SizedBox(height: kPaddingNormal),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(kBotNavRadius))),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: kInactiveIconColor,
          items: botNavItems,
        ),
      ),
    );
  }
}
