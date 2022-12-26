import 'package:flutter/material.dart';

// colors
const kPrimaryColor = Color(0xFFBC242A);
const kAccentColor = Color(0xFF103F70);
const kInactiveIconColor = Color(0xFFDE9294);
const kCardColor = Color(0xFFECF4F9);

// radius
const kBorderRadius = 5.0;
const kBotNavRadius = 12.0;

// font sizes
const kFontSizeXSmall = 10.0;
const kFontSizeSmall = 12.0;
const kFontSizeNormal = 14.0;
const kFontSizeMedium = 16.0;

// paddings
const kPaddingSmall = 4.0;
const kPaddingNormal = 8.0;
const kPaddingMedium = 12.0;
const kPaddingLarge = 16.0;
const kPaddingExtraLarge = 20.0;
const kPaddingExtraExtraLarge = 24.0;
const kPaddingMax = 30.0;

// Bot Nav Items
const List<BottomNavigationBarItem> botNavItems = [
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
    icon: Icon(Icons.more_horiz_rounded),
    label: 'المزيد',
  ),
];

// firestore table names
const kCategoriesTable = 'categories';
const kProductsTable = 'products';

// toggle data source
enum Sources { firebase, local }

const Sources kDataSource = Sources.firebase;
