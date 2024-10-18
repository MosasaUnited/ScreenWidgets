import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:screens/core/widgets/simple_leading_appbar.dart';

class GoToSignInSignUpScreen extends StatelessWidget {
  GoToSignInSignUpScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SimpleLeadingAppbar()),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    // SignIn View
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          child: const Text('Go to Sign Up'),
                        ).animate().rotate(
                            begin: -0.07, alignment: Alignment.bottomLeft),
                      ],
                    ),
                    // SignUp View
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate);
                          },
                          child: const Text('Go to Sign In'),
                        ).animate().rotate(
                            begin: -0.07, alignment: Alignment.bottomRight),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
