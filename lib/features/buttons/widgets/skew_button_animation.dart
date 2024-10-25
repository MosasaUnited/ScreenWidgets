import 'package:flutter/material.dart';
import 'package:screens/features/buttons/configs/pkg_colors.dart';
import 'package:screens/features/buttons/configs/pkg_sizes.dart';
import 'package:screens/features/buttons/enums/skew_positions.dart';
import 'package:screens/features/buttons/extensions/string_ex.dart';
import 'package:screens/features/buttons/extensions/widget_ex.dart';
import 'package:screens/features/buttons/util/animated_color_text.dart';


/// [SkewButtonAnimation] is a parallelogram button
/// that has the same behaviour with [PrettyColorSlideButton]
/// when tapped secondary color slides in from the left or center ( here, you'll have only 2 choices )
/// Tweak slide positions using [SkewPositions.left] or [SkewPositions.right]
///
class SkewButtonAnimation extends StatefulWidget {
  const SkewButtonAnimation({
    super.key,
    this.skewPosition = SkewPositions.left,
    this.horizontalPadding = s14,
    this.verticalPadding = s24,
    this.labelStyle,
    required this.label,
    this.firstBgColor = kBlack,
    this.secondBgColor = kWhite, required this.onPressed,
  });
  final SkewPositions skewPosition;
  final double horizontalPadding;
  final double verticalPadding;
  final TextStyle? labelStyle;
  final String label;
  final Color firstBgColor;
  final Color secondBgColor;
  final VoidCallback onPressed;
  @override
  State<SkewButtonAnimation> createState() => _SkewButtonAnimationState();
}

class _SkewButtonAnimationState extends State<SkewButtonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late EdgeInsetsGeometry padding;
  late Size textSize;
  late Size containerSize;
  bool isHalf = false;
  @override
  void initState() {
    super.initState();
    padding = EdgeInsets.symmetric(
      vertical: widget.horizontalPadding,
      horizontal: widget.verticalPadding,
    );
    _controller = AnimationController(vsync: this, duration: duration1000);
    _controller.addListener(controllerListener);
    textSize = widget.label.textSize(
      style: widget.labelStyle,
    );
    containerSize = Size(
      textSize.width + padding.horizontal,
      textSize.height + padding.vertical,
    );
  }

  void controllerListener() {
    if (_controller.value >= 0.5) {
      setState(() {
        isHalf = true;
      });
    } else {
      setState(() {
        isHalf = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else if(_controller.isDismissed){
          _controller.forward();
        }
        widget.onPressed();
      },
      child: Stack(
        alignment: widget.skewPosition == SkewPositions.left
            ? Alignment.centerLeft
            : Alignment.center,
        children: [
          Container(
            width: containerSize.width,
            height: containerSize.height,
            margin: EdgeInsets.only(left: widget.horizontalPadding),
            transform: Matrix4.skewX(-.3),
            decoration: BoxDecoration(
              color: widget.firstBgColor,
            ),
          ),
          SlideContainer(
            animation: _controller,
            containerSize: containerSize,
            secondBgColor: widget.secondBgColor,
            horizontalPadding: widget.horizontalPadding,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: AnimatedColorText(
              label: widget.label,
              labelStyle: widget.labelStyle,
              firstColor: widget.secondBgColor,
              secondColor: widget.firstBgColor,
              animation: _controller,
            ).addSizedBox(
              width: containerSize.width,
              height: containerSize.height,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideContainer extends AnimatedWidget {
  const SlideContainer({
    super.key,
    required this.animation,
    required this.containerSize,
    required this.secondBgColor,
    required this.horizontalPadding,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Size containerSize;
  final Color secondBgColor;
  final double horizontalPadding;

  Animation<double> get slideAnimation =>
      Tween<double>(begin: 0.0, end: containerSize.width)
          .animate(curvedAnimation);
  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: slideAnimation.value,
      height: containerSize.height,
      margin: EdgeInsets.only(left: horizontalPadding),
      transform: Matrix4.skewX(-.3),
      decoration: BoxDecoration(
        color: secondBgColor,
      ),
    );
  }
}
