import 'package:flutter/material.dart';

import 'animation/slide_list_view.dart';
import 'animation/animation.dart';
import 'screens/screen_loaders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // double radius = 0.0, dotRadius = 0.0;

  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test animations'),
        ),
        body: slideListView(
          wiew1: buildPageTest0(),
          wiew2: buildPageTest1(),
          ActionButtonColor: Colors.yellow,
          ActionButtionIcon: AnimatedIcons.view_list,
          showActionButton: true,
          defaultView: 'slides',
          duration: const Duration(milliseconds: 800),
        ),
        //child: Animated(),
        //child: screen_loaders(),
      ),
    );
  }

  animation() {
    return const SizedBox(
      child: Center(
        child: Animated(),
      ),
    );
  }

  buildPage(Color color, String text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buildPageTest0() {
    return SizedBox(
      child: Center(
        child: animation(),
      ),
    );
  }

  buildPageTest1() {
    return SizedBox(
      child: Center(
        child: screen_loaders(),
      ),
    );
  }
}
