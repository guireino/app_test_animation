import 'package:flutter/material.dart';

import 'package:animation_test/loaders/dotType.dart';

import '../animation/animation.dart';

import '../loaders/loaders_screen.dart';
import '../loaders/loaders_screen_2.dart';
import '../loaders/loaders_screen_3.dart';
import '../loaders/loaders_screen_4.dart';
import '../loaders/loaders_screen_5.dart';

class screen_loaders extends StatelessWidget {
  screen_loaders({Key? key}) : super(key: key);

  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: SizedBox(
                        child: loadersScreen_3(
                          color0: Colors.black,
                          color1: Colors.green,
                          color2: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: SizedBox(
                        child: loadersScreen_2(
                          colors: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        child: loadersScreen(
                          colors: colors,
                          duration: const Duration(seconds: 3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: SizedBox(
                        child: loadersScreen4(
                          radius: 26.0,
                          dotRadius: 6.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: SizedBox(
                        child: loaders_screen5(
                          dotOneColor: Colors.blue,
                          dotTwoColor: Colors.yellow,
                          dotThreeColor: Colors.brown,
                          duration: Duration(milliseconds: 1200),
                          dotType: DotType.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
