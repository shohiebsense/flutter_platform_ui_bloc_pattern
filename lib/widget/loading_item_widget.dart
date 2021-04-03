


import 'package:flutter/material.dart';

class LoadingItemTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: Placeholder(),
        ),
        title: Text('...', style: Theme.of(context).textTheme.headline6,),
        trailing: Text('\$ ...'),
      ),
    );
  }
}
