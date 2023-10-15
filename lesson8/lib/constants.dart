import 'dart:ui';

class Constants {
  

    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Лосось в соусе терияки', time: 45, imagePath: 'assets/images/r01.png')));
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Покебоул с сыром тофу', time: 30, imagePath: 'assets/images/r02.png')));
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Стейк из говядины по-грузински', time: 75, imagePath: 'assets/images/r03.png')));
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Тосты с голубикой и бананом', time: 45, imagePath: 'assets/images/r04.png')));  
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Паста с морепродуктами', time: 25, imagePath: 'assets/images/r05.png')));  
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Бургер с двумя котлетами', time: 60, imagePath: 'assets/images/r06.png'))); 
    // widgetList.add(SizedBox(height: Entity.widgetHeight, child: Entity(description: 'Пицца Марнарита домашняя', time: 25, 
  
  static Color backgroundColor = const Color.fromARGB(255, 236, 236, 236);
  static Color entityBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  static Color cookTimeColor = const Color.fromARGB(255, 46, 204, 113);

  static var itemDescriptions = [
    'Лосось в соусе терияки',
    'Покебоул с сыром тофу',
    'Стейк из говядины по-грузински',
    'Тосты с голубикой и бананом',
    'Паста с морепродуктами', 
    'Бургер с двумя котлетами',
    'Пицца Марнарита домашняя'];

  static var itemImagePaths = const [
    'assets/images/r01.png',
    'assets/images/r02.png',
    'assets/images/r03.png',
    'assets/images/r04.png',
    'assets/images/r05.png',
    'assets/images/r06.png',
    'assets/images/r07.png'
  ];

  static var cookTimes = [45, 30, 75, 45, 25, 60, 25];

}
