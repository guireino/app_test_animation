import 'package:flutter/material.dart';
import 'dart:math';

class loadersScreen_3 extends StatefulWidget {
  final Color color0, color1, color2;

  const loadersScreen_3({
    Key? key,
    required this.color0,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  _loadersScreen_3State createState() =>
      _loadersScreen_3State(color0, color1, color2);
}

class _loadersScreen_3State extends State<loadersScreen_3>
    with TickerProviderStateMixin {
  final Color color0, color1, color2;

  late Animation<double> animation0, animation1, animation2;
  late AnimationController controller0, controller1, controller2;

  _loadersScreen_3State(this.color0, this.color1, this.color2);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller0 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    controller1 =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    controller2 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    animation0 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller0,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller1,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller2,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    controller0.repeat();
    controller1.repeat();
    controller2.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // ignore: unnecessary_new
          new RotationTransition(
            turns: animation0,
            child: CustomPaint(
              painter: Arc1Painter(color0),
              child: const SizedBox(
                width: 50,
                height: 50,
              ),
            ),
          ),
          // ignore: unnecessary_new
          new RotationTransition(
            turns: animation1,
            child: CustomPaint(
              painter: Arc2Painter(color1),
              child: const SizedBox(
                width: 50,
                height: 50,
              ),
            ),
          ),
          // ignore: unnecessary_new
          new RotationTransition(
            turns: animation2,
            child: CustomPaint(
              painter: Arc3Painter(color2),
              child: const SizedBox(
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller0.dispose();
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
}

@override
class Arc1Painter extends CustomPainter {
  final Color color;

  const Arc1Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect1 = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    canvas.drawArc(rect1, 0.0, 0.8 * pi, false, p1);
    // canvas.drawArc(rect1, 0.6 * pi, 0.8 * pi, false, p1);
    // canvas.drawArc(rect1, 1.5 * pi, 0.4 * pi, false, p1);
  }

  @override
  bool shouldRepaint(CustomPainter paint) {
    return true;
  }
}

@override
class Arc2Painter extends CustomPainter {
  final Color color;

  const Arc2Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p2 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // ignore: unnecessary_new
    Rect rect2 = new Rect.fromLTWH(
      0.0 + (0.2 * size.width) / 2,
      0.0 + (0.2 * size.height) / 2,
      size.width - 0.2 * size.width,
      size.height - 0.2 * size.height,
    );

    // canvas.drawArc(rect2, 0.0, 0.5 * pi, false, p2);
    // canvas.drawArc(rect2, 0.8 * pi, 0.6 * pi, false, p2);
    canvas.drawArc(rect2, 0.0 * pi, 0.7 * pi, false, p2);
  }

  @override
  bool shouldRepaint(CustomPainter paint) {
    return true;
  }
}

@override
class Arc3Painter extends CustomPainter {
  final Color color;

  const Arc3Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p3 = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // ignore: unnecessary_new
    Rect rect3 = new Rect.fromLTWH(
      0.0 + (0.4 * size.width) / 2,
      0.0 + (0.4 * size.height) / 2,
      size.width - 0.4 * size.width,
      size.height - 0.4 * size.height,
    );

    canvas.drawArc(rect3, 0.0, 0.9 * pi, false, p3);
    //canvas.drawArc(rect3, 1.1 * pi, 0.8 * pi, false, p3);
  }

  @override
  bool shouldRepaint(CustomPainter paint) {
    return true;
  }
}
