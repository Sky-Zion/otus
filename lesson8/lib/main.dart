import 'package:flutter/material.dart';
import 'package:lesson8/entity_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: Column()),
                      Expanded(
                          flex: 28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child:EntityList())
                              ],
                          )),
                      Expanded(flex: 1, child: Column()),
                    ],
                  )
                  // child: const Entity()
                  ),
            ),
          )),
    );
  }
}
