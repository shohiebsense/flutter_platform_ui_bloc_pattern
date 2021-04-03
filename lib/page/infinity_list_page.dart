import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_platform_design/model/catalog.dart';
import 'package:ui_platform_design/widget/item_widget.dart';
import 'package:ui_platform_design/widget/loading_item_widget.dart';

class InfinityListPage extends StatelessWidget {
  const InfinityListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinity List Sample'),
      ),
      body: Selector<Catalog, int?>(
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
            itemCount: itemCount,
            padding: const EdgeInsets.symmetric(vertical: 18),
            itemBuilder: (context,  index){
              var catalog = Provider.of<Catalog>(context);

              var item = catalog.getByIndex(index);

              if(item.isLoading){
                return LoadingItemTile();
              }

              return ItemTile(item: item);

            }),
      ),
    );
  }
}
