import 'package:flutter/material.dart';
import 'package:screens/core/routing/app_router.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}