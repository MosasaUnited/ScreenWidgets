import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:screens/core/theme/design_system.dart';
import 'package:screens/core/theme/mytheme.dart';
import 'package:screens/core/widgets/simple_leading_appbar.dart';
import '../widgets/button_tap_effect.dart';

class ExploreCollectionCard extends StatelessWidget {
  const ExploreCollectionCard({
    super.key,
    required this.title,
    required this.bodyText,
    required this.onTap,
    required this.imageUrl,
  });

  final String title;
  final String bodyText;
  final VoidCallback onTap;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SimpleLeadingAppbar()),
      body: ButtonTapEffect(
        onTap: onTap,
        borderRadius: 14,
        margin:
            EdgeInsets.only(right: MySpaceSystem.spaceX3, top: 4, bottom: 4),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: ShapeDecoration(
            color: themeData.colorScheme.secondary,
            shadows: cardShadow,
            shape: SmoothRectangleBorder(
              side: BorderSide(
                width: 1.5,
                color: themeData.colorScheme.outline,
              ),
              borderRadius: SmoothBorderRadius(
                cornerRadius: 12,
                cornerSmoothing: 1,
              ),
            ),
          ),
          child: Stack(
            children: [
              // Big First Letter
              Positioned(
                right: MySpaceSystem.spaceX2,
                top: 0,
                child: Text(
                  title[0].toString(),
                  style: TextStyle(
                    fontSize: 144,
                    height: 1,
                    color: themeData.colorScheme.outline,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ).animate().fadeIn(delay: 300.ms),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title and Categories count
                  Padding(
                    padding: EdgeInsets.all(MySpaceSystem.spaceX2 + 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: themeData.textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: MySpaceSystem.spaceX,
                              ),
                              Text(
                                bodyText,
                                style: themeData.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                      .animate(delay: 200.ms)
                      .moveX(begin: -100)
                      .then()
                      .shakeX(hz: 4, amount: 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
