import 'package:flutter/material.dart';
import 'package:screens/features/buttons/configs/pkg_sizes.dart';

/// Neumorphic style button
/// When using neumorphic button, to feel neumorphic effect,
/// you'll have to change the color surrounding the neumorphic button other than white
/// ⚠️Don't use white color or you'll see weird effect
/// I suggest using light or medium grey colors like [Colors.grey.shade100],[Colors.grey.shade200],[Colors.grey.shade300],etc
class NeumorphicButtonAnimation extends StatefulWidget {
  const NeumorphicButtonAnimation({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelStyle,
    this.padding,
    this.duration,
    this.borderRadius,
  });

  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final Duration? duration;
  final double? borderRadius;

  @override
  State<NeumorphicButtonAnimation> createState() => _NeumorphicButtonAnimationState();
}

class _NeumorphicButtonAnimationState extends State<NeumorphicButtonAnimation> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isElevated = false;
        });
        widget.onPressed();
      },
      onTapUp: (_) {
        setState(() {
          _isElevated = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isElevated = true;
        });
      },
      child: AnimatedContainer(
        duration: widget.duration ?? duration500,
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: s42, vertical: s14),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(widget.borderRadius ?? s50),
          boxShadow: _isElevated
              ? [
                  const BoxShadow(
                    color: Color(0xFFBEBEBE),
                    offset: Offset(10, 10),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-10, -10),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0xFFBEBEBE),
                    offset: Offset(-10, -10),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(10, 10),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.label,
            style: widget.labelStyle,
          ),
        ),
      ),
    );
  }
}
