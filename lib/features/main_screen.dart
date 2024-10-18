import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:screens/core/routing/app_router.dart';

class MainScreen extends StatelessWidget {
  final List<String> buttonLabels = [
    'Auth with Animation',
    'ExploreCollectionCard',
    'Nothing Example',
    'Go To SignIn/SignUp',
  ];

  final List<String> routes = [
    AppRouter.kAuthWithAnimation,
    AppRouter.kExploreCollectionCard,
    AppRouter.kNothingExample,
    AppRouter.kGoToSignInSignUp,
  ]; // Define corresponding routes here

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen Widgts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: buttonLabels.length, // Number of buttons in the list
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                context.push(routes[index]);
              },
              child: Text(
                buttonLabels[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
