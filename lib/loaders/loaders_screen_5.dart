import 'package:flutter/material.dart';
import 'dart:math';

import 'package:animation_test/loaders/dotType.dart';

class loaders_screen5 extends StatefulWidget {
  final Color dotOneColor, dotTwoColor, dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const loaders_screen5({
    this.dotOneColor = Colors.black,
    this.dotTwoColor = Colors.black,
    this.dotThreeColor = Colors.black,
    this.duration = const Duration(seconds: 3),
    this.dotType = DotType.circle,
    this.dotIcon = const Icon(Icons.blur_on),
  });

  @override
  _loaders_screen5_State createState() => _loaders_screen5_State();
}

class _loaders_screen5_State extends State<loaders_screen5>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_0, animation_1, animation_2;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    animation_0 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.bounceOut), // 0.0, 0.80
      ),
    );

    animation_1 = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.9, curve: Curves.bounceOut),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.bounceOut), // 0.2, 1.0
      ),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(
              0.0,
              -30 *
                  (animation_0.value <= 0.50
                      ? animation_0.value
                      : 1.0 - animation_0.value),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotOneColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              0.0,
              -30 *
                  (animation_1.value <= 0.50
                      ? animation_1.value
                      : 1.0 - animation_1.value),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotTwoColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              0.0,
              -30 *
                  (animation_2.value <= 0.50
                      ? animation_2.value
                      : 1.0 - animation_2.value),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotThreeColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  final DotType? type;
  final Icon? icon;

  const Dot({Key? key, this.radius, this.color, this.type, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon!.icon,
              color: color,
              size: 1.3 * radius!,
            )
          // ignore: unnecessary_new
          : new Transform.rotate(
              angle: type == DotType.circle ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                  color: color,
                  shape: type == DotType.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                ),
              ),
            ),
    );
  }
}
