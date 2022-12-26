import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/model/category_model_entity.dart';
import 'package:task/widgets/loading_indicator.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModelEntity categoryModel;

  const CategoryCard({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingNormal),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kPaddingNormal),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: categoryModel.image,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: kPaddingMedium),
          Text(
            categoryModel.title,
            style: const TextStyle(color: kAccentColor),
          )
        ],
      ),
    );
  }
}
