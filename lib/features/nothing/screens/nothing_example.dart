import 'package:flutter/material.dart';
import 'package:screens/core/widgets/simple_leading_appbar.dart';
import 'package:screens/features/nothing/widgets/nothing.dart';

class NothingExample extends StatelessWidget {
  const NothingExample({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasData = true;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SimpleLeadingAppbar(),
      ),
      body: Container(
        child: hasData
            ? const Center(
                child: Text('Here We Go'),
              )
            // ignore: dead_code
            : const Nothing(),
      ),
    );
  }
}
