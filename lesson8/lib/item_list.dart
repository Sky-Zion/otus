import 'package:flutter/material.dart';
import 'package:lesson8/item.dart';

import 'constants.dart';

class ItemList extends ListView {
  ItemList({super.key});

  List<Widget> _initEntityList() {
    List<Widget> widgetList = List.empty(growable: true);

    for (int i = 0; i < Constants.itemDescriptions.length; i++) {
      widgetList.add(SizedBox(
        height: Item.widgetHeight, 
        child: Item(description: Constants.itemDescriptions[i], 
        time: Constants.cookTimes[i], 
        imagePath: Constants.itemImagePaths[i])));
    }
    return widgetList;

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = _initEntityList();
    return ListView.separated(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return widgetList[index];
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 18,
            ));
  }
}
