

import 'package:ui_platform_design/model/item.dart';

class ItemPage {
  final List<Item> itemList;
  final int startingIndex;
  final bool hasNext;

  ItemPage({required this.itemList, required this.startingIndex, required this.hasNext});
}