import 'package:flutter/material.dart';
import 'dart:math';

class ColorLoaderThree extends StatefulWidget {
  final double radius;
  final double dotRadius;

  const ColorLoaderThree({
    super.key,
    this.radius = 30.0,
    this.dotRadius = 3.0,
  });

  @override
  ColorLoaderThreeState createState() => ColorLoaderThreeState();
}

class ColorLoaderThreeState extends State<ColorLoaderThree> with SingleTickerProviderStateMixin {
  late final Animation<double> animationRotation;
  late final Animation<double> animationRadiusIn;
  late final Animation<double> animationRadiusOut;
  late final AnimationController controller;
  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * animationRadiusIn.value;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = widget.radius * animationRadiusOut.value;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Center(
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0.0, 0.0),
                  child: Dot(
                    radius: radius,
                    color: Colors.black12,
                  ),
                ),
                for (int i = 0; i < 8; i++)
                  Transform.translate(
                    offset: Offset(
                      radius * cos(i * pi / 4),
                      radius * sin(i * pi / 4),
                    ),
                    child: Dot(
                      radius: dotRadius,
                      color: _getColor(i),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.amber;
      case 1:
        return Colors.deepOrangeAccent;
      case 2:
        return Colors.pinkAccent;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.yellow;
      case 5:
        return Colors.lightGreen;
      case 6:
        return Colors.orangeAccent;
      case 7:
        return Colors.blueAccent;
      default:
        return Colors.black;
    }
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

  const Dot({super.key, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
