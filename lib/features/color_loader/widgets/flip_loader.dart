import 'package:flutter/material.dart';
import 'dart:math';

class FlipLoader extends StatefulWidget {
  final Color loaderBackground;
  final Color iconColor;
  final IconData icon;
  final String animationType;
  final String shape;
  final bool rotateIcon;

  const FlipLoader({
    super.key,
    this.loaderBackground = Colors.redAccent,
    this.iconColor = Colors.white,
    this.icon = Icons.sync,
    this.animationType = "full_flip",
    this.shape = "square",
    this.rotateIcon = true,
  });

  @override
  FlipLoaderState createState() => FlipLoaderState();
}

class FlipLoaderState extends State<FlipLoader> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotationHorizontal;
  late final Animation<double> rotationVertical;

  @override
  void initState() {
    super.initState();
    controller = _createAnimationController(widget.animationType);
    controller.addStatusListener((status) {
      if (widget.animationType == "half_flip") {
        if (status == AnimationStatus.completed) {
          setState(() {
            controller.repeat();
          });
        }
      } else if (widget.animationType == "full_flip") {
        if (status == AnimationStatus.dismissed || status == AnimationStatus.completed) {
          setState(() {
            controller.forward();
          });
        }
      }
    });
    controller.forward();
  }

  AnimationController _createAnimationController(String type) {
    final animCtrl = AnimationController(
      duration: type == "half_flip"
          ? const Duration(seconds: 10)
          : const Duration(seconds: 10),
      vsync: this,
    );

    rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animCtrl,
        curve: const Interval(0.0, 0.50, curve: Curves.linear),
      ),
    );

    rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animCtrl,
        curve: const Interval(0.50, 1.0, curve: Curves.linear),
      ),
    );

    return animCtrl;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.006)
            ..rotateX(2 * pi * rotationVertical.value)
            ..rotateY(2 * pi * rotationHorizontal.value),
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              shape: widget.shape == "circle" ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: widget.shape == "circle"
                  ? null
                  : const BorderRadius.all(Radius.circular(8.0)),
              color: widget.loaderBackground,
            ),
            width: 40.0,
            height: 40.0,
            child: Center(
              child: widget.rotateIcon
                  ? RotationTransition(
                      turns: rotationHorizontal.value == 1.0
                          ? rotationVertical
                          : rotationHorizontal,
                      child: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: 20.0,
                      ),
                    )
                  : Icon(
                      widget.icon,
                      color: widget.iconColor,
                      size: 20.0,
                    ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
