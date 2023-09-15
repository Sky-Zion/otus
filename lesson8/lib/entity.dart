import 'package:flutter/material.dart';

class Entity extends StatelessWidget {
  late Image? image;
  late String? imagePath;
  late String? description;
  late int? time;

  Entity({this.imagePath, this.description, this.time, super.key}) {
    if (imagePath != null) {
      image = Image(image: AssetImage(imagePath!));
    }
  }

  static double widgetHeight = 136;
  static Color backgroundColor = const Color.fromARGB(255, 236, 236, 236);
  static Color entityBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Align(
          alignment: Alignment.center,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.all(1),
                height: 136,
                width: double.infinity,
                color: entityBackgroundColor,
                child: Row(children: [
                  SizedBox(width: 149, height: widgetHeight, child: image),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 25, left: 15, right: 15),
                          alignment: Alignment.bottomLeft,
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(children: [
                            Expanded(
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(description!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Expanded(
                                    child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: const Image(
                                            image: AssetImage(
                                                'assets/images/clock.png'))),
                                    Text('$time минут',
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 46, 204, 113)))
                                  ],
                                )))
                          ])))
                ]),
              )),
        ));
  }
}
