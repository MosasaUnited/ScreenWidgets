import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screens/core/widgets/simple_leading_appbar.dart';
import 'package:screens/features/auth_with_animation/widgets/onboarding_content.dart';

class AuthWithAnimation extends StatefulWidget {
  const AuthWithAnimation({super.key});

  @override
  State<AuthWithAnimation> createState() => _AuthWithAnimationState();
}

class _AuthWithAnimationState extends State<AuthWithAnimation> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        builder: (_) => const OnboardContent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SimpleLeadingAppbar(),
        ),
      body: Lottie.asset(
        "assets/lottie/background.json",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
