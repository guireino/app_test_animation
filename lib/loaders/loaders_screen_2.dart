import 'package:flutter/material.dart';

class loadersScreen_2 extends StatefulWidget {
  final Color colors;

  const loadersScreen_2({Key? key, required this.colors}) : super(key: key);

  @override
  _loadersScreen_2State createState() => _loadersScreen_2State(colors);
}

class _loadersScreen_2State extends State<loadersScreen_2>
    with TickerProviderStateMixin {
  late AnimationController controller;

  final Color colors;

  _loadersScreen_2State(this.colors);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
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
        strokeWidth: 5,
        color: colors,
        value: controller.value,
      ),
    );
  }
}
