import 'package:flutter/material.dart';
import 'dart:math';
import 'dot_type.dart';

class ColorLoaderFour extends StatefulWidget {
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const ColorLoaderFour({
    super.key,
    this.dotOneColor = Colors.redAccent,
    this.dotTwoColor = Colors.green,
    this.dotThreeColor = Colors.blueAccent,
    this.duration = const Duration(milliseconds: 1000),
    this.dotType = DotType.circle,
    this.dotIcon = const Icon(Icons.blur_on),
  });

  @override
  ColorLoaderFourState createState() => ColorLoaderFourState();
}

class ColorLoaderFourState extends State<ColorLoaderFour> with SingleTickerProviderStateMixin {
  late final Animation<double> animation1;
  late final Animation<double> animation2;
  late final Animation<double> animation3;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);

    animation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.80, curve: Curves.ease),
      ),
    );

    animation2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );

    animation3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTransform(animation1, widget.dotOneColor),
          _buildTransform(animation2, widget.dotTwoColor),
          _buildTransform(animation3, widget.dotThreeColor),
        ],
      ),
    );
  }

  Transform _buildTransform(Animation<double> animation, Color color) {
    return Transform.translate(
      offset: Offset(
        0.0,
        -30 * (animation.value <= 0.50 ? animation.value : 1.0 - animation.value),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Dot(
          radius: 10.0,
          color: color,
          type: widget.dotType,
          icon: widget.dotIcon,
        ),
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

  const Dot({super.key, this.radius, this.color, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(icon!.icon, color: color, size: 1.3 * radius!)
          : Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                  color: color,
                  shape: type == DotType.circle ? BoxShape.circle : BoxShape.rectangle,
                ),
              ),
            ),
    );
  }
}
