import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/model/product_model_entity.dart';
import 'package:task/widgets/loading_indicator.dart';

class ProductCard extends StatelessWidget {
  final ProductModelEntity productModel;

  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        margin: const EdgeInsets.symmetric(
            horizontal: kPaddingNormal, vertical: kPaddingSmall),
        child: Stack(
          children: [
            Positioned(
                left: kPaddingSmall,
                top: kPaddingSmall,
                child: Container(
                    padding: const EdgeInsets.all(kPaddingSmall),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.grey.shade400))),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.grey.shade400,
                    ))),
            Padding(
              padding: const EdgeInsets.all(kPaddingNormal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CachedNetworkImage(
                          imageUrl: productModel.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error_outline,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: kPaddingSmall),
                        Text(
                          productModel.name,
                          style: const TextStyle(color: kAccentColor),
                        ),
                        Center(
                            child: Text(
                          '${productModel.price}\n',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kBorderRadius)),
                        side: const BorderSide(color: kPrimaryColor)),
                    onPressed: () {},
                    label: const Text(
                      'إضافة الي العربة',
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kPrimaryColor,
                      size: kFontSizeNormal,
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
