

import 'package:flutter/material.dart';
import 'package:ui_platform_design/model/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  ItemTile({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: item.color,
          ),
        ),
        title: Text(item.name, style: Theme.of(context).textTheme.headline6,),
        trailing: Text('\$ ${(item.price / 100).toStringAsFixed(2)}'),
      ),
    );
  }
}
