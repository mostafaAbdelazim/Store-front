import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/model/product_model.dart';

class PromoCard extends StatelessWidget {
  final ProductModel productModel;

  const PromoCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: productModel.backgroundColor,
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: productModel.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModel.promotion,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        'طلباتك من مكان واحد',
                        style: TextStyle(color: kAccentColor, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              'تطبق الشروط و الاحكام',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
