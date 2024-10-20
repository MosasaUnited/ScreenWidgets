import 'package:flutter/material.dart';
import 'package:screens/features/buttons/configs/pkg_sizes.dart';
import 'package:screens/features/buttons/util/button_text_style.dart';
import 'package:screens/features/buttons/widgets/bar_button_animation.dart';
import 'package:screens/features/buttons/widgets/border_button_animation.dart';
import 'package:screens/features/buttons/widgets/capsule_button_animation.dart';
import 'package:screens/features/buttons/widgets/color_slide_button_animation.dart';
import 'package:screens/features/buttons/widgets/fuzzy_button_animation.dart';
import 'package:screens/features/buttons/widgets/neumorphic_button_animation.dart';
import 'package:screens/features/buttons/widgets/skew_button_animation.dart';
import 'package:screens/features/buttons/widgets/slide_icon_button_animation.dart';
import 'package:screens/features/buttons/widgets/wave_button_animation.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              BarButtonAnimation(
                label: 'Bar Button',
                bgColor: Colors.red,
                borderColor: Colors.blue,
                onPressed: () {},
                borderWidth: double.infinity,
                labelStyle: ButtonTextStyle.buttonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              BorderButtonAnimation(
                label: 'Border Button',
                bgColor: Colors.black,
                borderColor: Colors.amber,
                onPressed: () {},
                labelStyle: ButtonTextStyle.buttonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              CapsuleButtonAnimation(
                label: 'Capsule Button',
                bgColor: Colors.purple,
                onPressed: () {},
                labelStyle: ButtonTextStyle.buttonTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ColorSlideButtonAnimation(
                label: 'Color Slide Button',
                bgColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                onPressed: () {},
                labelStyle: ButtonTextStyle.buttonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              FuzzyButtonAnimation(
                label: 'Fuzzy Button',
                onPressed: () {},
                labelStyle: ButtonTextStyle.buttonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              NeumorphicButtonAnimation(
                label: 'Neumorphic Button',
                duration: const Duration(milliseconds: 500),
                borderRadius: s10,
                labelStyle: ButtonTextStyle.buttonTextStyle,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              SlideIconButtonAnimation(
                label: 'Slide Icon Button',
                onPressed: () {},
                foregroundColor: Colors.red,
                icon: Icons.double_arrow_rounded,
                labelStyle: ButtonTextStyle.buttonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SkewButtonAnimation(
                label: 'Skew Button',
                firstBgColor: Colors.cyan,
                secondBgColor: Colors.indigo,
                labelStyle: ButtonTextStyle.buttonTextStyle,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              WaveButtonAnimation(
                child: Text(
                  'Wave Button',
                  style: ButtonTextStyle.buttonTextStyle,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
