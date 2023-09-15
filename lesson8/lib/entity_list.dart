import 'package:flutter/material.dart';
import 'package:lesson8/entity.dart';

class EntityList extends ListView {
  EntityList({super.key});

  List<Widget> _initEntityList() {
    List<Widget> widgetList = List.empty(growable: true);
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Лосось в соусе терияки', time: 45, imagePath: 'assets/images/r01.png')));
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Покебоул с сыром тофу', time: 30, imagePath: 'assets/images/r02.png')));
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Стейк из говядины по-грузински', time: 75, imagePath: 'assets/images/r03.png')));
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Тосты с голубикой и бананом', time: 45, imagePath: 'assets/images/r04.png')));  
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Паста с морепродуктами', time: 25, imagePath: 'assets/images/r05.png')));  
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Бургер с двумя котлетами', time: 60, imagePath: 'assets/images/r06.png'))); 
    widgetList.add(Container(height: Entity.widgetHeight, child: Entity(description: 'Пицца Марнарита домашняя', time: 25, imagePath: 'assets/images/r07.png'))); 
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
