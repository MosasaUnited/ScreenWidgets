import 'package:flutter/material.dart';
import 'dart:math';

class ColorLoaderTwo extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const ColorLoaderTwo({
    super.key,
    this.color1 = Colors.deepOrangeAccent,
    this.color2 = Colors.yellow,
    this.color3 = Colors.lightGreen,
  });

  @override
  ColorLoaderTwoState createState() => ColorLoaderTwoState();
}

class ColorLoaderTwoState extends State<ColorLoaderTwo> with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    controller3 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller1,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    animation2 = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller2,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
    animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller3,
        curve: const Interval(0.0, 1.0, curve: Curves.decelerate),
      ),
    );

    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          RotationTransition(
            turns: animation1,
            child: CustomPaint(
              painter: ArcPainter(widget.color1, 2.0, 0.5 * pi, 0.6 * pi, 1.5 * pi, 0.4 * pi),
              child: const SizedBox(width: 50.0, height: 50.0),
            ),
          ),
          RotationTransition(
            turns: animation2,
            child: CustomPaint(
              painter: ArcPainter(widget.color2, 2.0, 0.5 * pi, 0.8 * pi, 1.6 * pi, 0.2 * pi, true),
              child: const SizedBox(width: 50.0, height: 50.0),
            ),
          ),
          RotationTransition(
            turns: animation3,
            child: CustomPaint(
              painter: ArcPainter(widget.color3, 1.5, 0.9 * pi, 1.1 * pi, null, null, true, 0.4),
              child: const SizedBox(width: 50.0, height: 50.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}

class ArcPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double startAngle1;
  final double sweepAngle1;
  final double? startAngle2;
  final double? sweepAngle2;
  final bool isCentered;
  final double scale;

  ArcPainter(this.color, this.strokeWidth, this.startAngle1, this.sweepAngle1,
      [this.startAngle2, this.sweepAngle2, this.isCentered = false, this.scale = 0]);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(
      (isCentered ? scale : 0) * size.width / 2,
      (isCentered ? scale : 0) * size.height / 2,
      size.width - scale * size.width,
      size.height - scale * size.height,
    );

    canvas.drawArc(rect, startAngle1, sweepAngle1, false, paint);
    if (startAngle2 != null && sweepAngle2 != null) {
      canvas.drawArc(rect, startAngle2!, sweepAngle2!, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
