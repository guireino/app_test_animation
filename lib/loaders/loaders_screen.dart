import 'dart:async';

import 'package:flutter/material.dart';

class loadersScreen extends StatefulWidget {
  final List<Color> colors;
  final Duration duration;

  const loadersScreen({Key? key, required this.colors, required this.duration})
      : super(key: key);

  @override
  _loadersScreenState createState() => _loadersScreenState(colors, duration);
}

class _loadersScreenState extends State<loadersScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final List<Color> colors;
  final Duration duration;
  late Timer timer;

  List<ColorTween> colorsAnimations = [];
  List<Animation<Color?>> valueAnimations = [];

  int colorsIndex = 0;

  _loadersScreenState(this.colors, this.duration);

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   )..addListener(() {
  //       setState(() {});
  //     });

  //   controller.repeat(reverse: true);
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();

    // ignore: unnecessary_new
    controller = new AnimationController(
      vsync: this,
      duration: duration,
    );

    for (var i = 0; i < colors.length - 1; i++) {
      colorsAnimations.add(ColorTween(begin: colors[i], end: colors[i + 1]));
    }

    colorsAnimations
        .add(ColorTween(begin: colors[colors.length - 1], end: colors[0]));

    for (int i = 0; i < colors.length; i++) {
      Animation<Color?> animation = colorsAnimations[i].animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval((1 / colors.length) * (i + 1) - 0.05,
              (1 / colors.length) * (i + 1),
              curve: Curves.linear),
        ),
      );

      valueAnimations.add(animation);
    }

    timer = Timer.periodic(duration, (Timer t) {
      setState(() {
        colorsIndex = (colorsIndex + 1) % colors.length;
      });
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: valueAnimations[colorsIndex],
      ),
    );
  }
}
