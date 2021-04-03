
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_platform_design/model/item.dart';
import 'package:ui_platform_design/model/item_page.dart';
import 'package:ui_platform_design/services/fetch_service.dart';
import 'package:ui_platform_design/utils.dart';



class Catalog extends ChangeNotifier {

  static const maxCacheDistance = 100;

  final Map<int, ItemPage> _pages = {};


  final Set<int> _pagesBeingFetched = {};

  int? itemCount;

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    // Add code before the super
    super.dispose();
  }

  Item getByIndex(int index){
    var startingIndex = (index ~/ itemsPerPage) * itemsPerPage;

    if(_pages.containsKey(startingIndex)){
      var item = _pages[startingIndex]!.itemList[index - startingIndex];
      return item;
    }

    _fetchPage(startingIndex);
    return Item.loading();

  }

  Future<void> _fetchPage(int startingIndex) async {
    if(_pagesBeingFetched.contains(startingIndex)){
      return;
    }

    _pagesBeingFetched.add(startingIndex);
    final page = await fetchPage(startingIndex);
    _pagesBeingFetched.remove(startingIndex);

    if(!page.hasNext){
      itemCount = startingIndex + page.itemList.length;
    }

    _pages[startingIndex] = page;
    _pruneCache(startingIndex);

    if(!_isDisposed){
      notifyListeners();
    }
  }

  void _pruneCache(int currentStartingIndex){
    final keysToRemove = <int>{};
    for(final key in _pages.keys){
      if((key - currentStartingIndex).abs() > maxCacheDistance){
        keysToRemove.add(key);
      }
    }

    for(final key in keysToRemove){
      _pages.remove(key);
    }
  }


}