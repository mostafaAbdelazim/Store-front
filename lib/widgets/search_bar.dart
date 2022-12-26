import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingLarge),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  kPaddingSmall, kPaddingSmall, kPaddingLarge, kPaddingSmall),
              decoration: BoxDecoration(
                  border: Border.all(color: kAccentColor),
                  borderRadius: BorderRadius.circular(kBorderRadius)),
              child: const TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'بحث',
                  hintStyle:
                      TextStyle(color: Colors.grey, fontSize: kFontSizeSmall),
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: kPaddingMedium),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius)),
                padding: const EdgeInsets.symmetric(
                    horizontal: kPaddingMax,
                    vertical: kPaddingExtraExtraLarge - 2)),
            onPressed: () {},
            child: Image.asset(
              'assets/images/vertical_sliders.png',
              color: Colors.white,
              width: kFontSizeMedium,
              height: kFontSizeMedium,
            ),
          ),
        ],
      ),
    );
  }
}
