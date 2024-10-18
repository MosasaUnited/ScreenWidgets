import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleLeadingAppbar extends StatelessWidget {
  const SimpleLeadingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,),
        onPressed: (){
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}