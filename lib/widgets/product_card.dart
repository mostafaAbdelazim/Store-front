import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Stack(
          children: [
            Positioned(
                left: 4,
                top: 4,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.grey.shade400))),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.grey.shade400,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CachedNetworkImage(
                    imageUrl: productModel.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error_outline,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    productModel.name,
                    style: const TextStyle(color: kAccentColor),
                  ),
                  const SizedBox(height: 2),
                  Center(child: Text(productModel.price)),
                  const SizedBox(height: 4),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        side: const BorderSide(color: kPrimaryColor)),
                    onPressed: () {},
                    label: const Text(
                      'إضافة الي العربة',
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kPrimaryColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
