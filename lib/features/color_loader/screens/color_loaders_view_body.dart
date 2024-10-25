import 'package:flutter/material.dart';
import 'package:screens/core/widgets/simple_leading_appbar.dart';
import 'package:screens/features/color_loader/widgets/color_loader_five.dart';
import 'package:screens/features/color_loader/widgets/color_loader_four.dart';
import 'package:screens/features/color_loader/widgets/color_loader_one.dart';
import 'package:screens/features/color_loader/widgets/color_loader_three.dart';
import 'package:screens/features/color_loader/widgets/color_loader_two.dart';
import 'package:screens/features/color_loader/widgets/flip_loader.dart';

class ColorLoadersViewBody extends StatelessWidget {
  const ColorLoadersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SimpleLeadingAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('C o l o r s  L o a d e r s', style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),),
            ColorLoaderOne(
              colors: [Colors.red, Colors.amber, Colors.green],
              duration: Duration(
                seconds: 2,
              ),
            ),
            ColorLoaderTwo(),
            ColorLoaderThree(),
            ColorLoaderFour(),
            ColorLoaderFive(),
            FlipLoader(),
          ],
        ),
      ),
    );
  }
}
