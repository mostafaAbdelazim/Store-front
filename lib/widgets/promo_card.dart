import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/model/product_model_entity.dart';
import 'package:task/widgets/loading_indicator.dart';

class PromoCard extends StatelessWidget {
  final ProductModelEntity productModel;

  const PromoCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kPaddingNormal),
      decoration: BoxDecoration(
          color: Color(int.parse(productModel.backgroundColor)),
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kPaddingExtraExtraLarge, horizontal: kPaddingMedium),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: productModel.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(width: kPaddingMedium),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModel.promotion,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: kFontSizeMedium,
                      ),
                    ),
                    const SizedBox(height: kPaddingMedium),
                    Container(
                      padding: const EdgeInsets.all(kPaddingNormal),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        'طلباتك من مكان واحد',
                        style: TextStyle(
                            color: kAccentColor, fontSize: kFontSizeSmall),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: kPaddingMedium,
            left: kPaddingMedium,
            child: Text(
              'تطبق الشروط و الاحكام',
              style: TextStyle(color: Colors.white, fontSize: kFontSizeXSmall),
            ),
          )
        ],
      ),
    );
  }
}
