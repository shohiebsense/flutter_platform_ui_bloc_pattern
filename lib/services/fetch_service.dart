



import 'package:flutter/material.dart';
import 'package:ui_platform_design/model/item.dart';
import 'package:ui_platform_design/model/item_page.dart';
import 'package:ui_platform_design/utils.dart';

Future<ItemPage> fetchPage(int startingIndex) async {

  await Future<void>.delayed(const Duration(milliseconds: 500));

  if(startingIndex > catalogLength){
    return ItemPage(itemList: [], startingIndex: startingIndex, hasNext: false);
  }

  return ItemPage(
    itemList: List.generate(itemsPerPage, (index) => Item(
      color: Colors.primaries[index % Colors.primaries.length],
      name: 'Color #${startingIndex + index}',
      price: 50 + (index + 42) % 200,
    )),
    startingIndex: startingIndex,
    hasNext: startingIndex + itemsPerPage < catalogLength,
  );
}