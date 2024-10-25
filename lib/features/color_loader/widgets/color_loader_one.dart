import 'package:flutter/material.dart';
import 'dart:async';

class ColorLoaderOne extends StatefulWidget {
  final List<Color> colors;
  final Duration duration;

  const ColorLoaderOne({
    super.key,
    required this.colors,
    required this.duration,
  });

  @override
  ColorLoaderOneState createState() => ColorLoaderOneState();
}

class ColorLoaderOneState extends State<ColorLoaderOne> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final List<ColorTween> tweenAnimations;
  late final List<Animation<Color?>> colorAnimations;
  late final Timer timer;
  int tweenIndex = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    tweenAnimations = List.generate(
      widget.colors.length,
      (i) => ColorTween(
        begin: widget.colors[i],
        end: widget.colors[(i + 1) % widget.colors.length],
      ),
    );

    colorAnimations = List.generate(
      widget.colors.length,
      (i) => tweenAnimations[i].animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            (1 / widget.colors.length) * i,
            (1 / widget.colors.length) * (i + 1),
            curve: Curves.linear,
          ),
        ),
      ),
    );

    timer = Timer.periodic(widget.duration, (Timer t) {
      setState(() {
        tweenIndex = (tweenIndex + 1) % widget.colors.length;
      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        valueColor: colorAnimations[tweenIndex],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }
}
