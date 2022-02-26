import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Animated extends StatefulWidget {
  const Animated({Key? key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated>
    with SingleTickerProviderStateMixin {
  Tween<double> scaleTween = Tween<double>(begin: 0, end: 15);

  double width = 180;
  double height = 120;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  animationBox() {
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child: const Center(
        child: Text('Test!'),
      ),
    );
  }

  animationBoxUpdate() {
    return TweenAnimationBuilder(
      tween: scaleTween,
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, double value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        width: 180.0,
        height: 120.0,
        color: Colors.yellow,
        child: const Center(
          child: Text('Test!'),
        ),
      ),
    );
  }

  animationRow() {
    return Container(
      width: 180.0,
      height: 15.0,
      color: Colors.blue,
      child: const Center(
        child: Text('Test!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                child: animationBox(),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                child: animationRow(),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }
}
