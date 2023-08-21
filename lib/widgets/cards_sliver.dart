import 'package:bank_app_ui/providers/scroll_offset_provider.dart';
import 'package:bank_app_ui/utils/assets.dart';
import 'package:bank_app_ui/utils/magic_numbers.dart';
import 'package:bank_app_ui/utils/utils.dart';
import 'package:bank_app_ui/widgets/cards_carousel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/card_carousel_offset_provider.dart';

class CardSliver extends StatelessWidget {
  const CardSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final offset = ref.watch(scrollOffsetProvider);
        return SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Transform.scale(
                scale: offsetToScale(offset),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: child,
                ),
              ),
            ));
      },
      child: Consumer(
        builder: (context, ref, child) {
          final carouselOffset = ref.watch(cardCarouselOffsetProvider);
          return Stack(
            children: [
              child ?? const SizedBox.shrink(),
              Positioned(
                top: getTopOffsetOfFrontUpperNode(carouselOffset),
                left: getLeftOffsetOfFrontUpperNode(carouselOffset),
                child: Image.asset(circleNode, scale: 3),
              ),
              Positioned(
                bottom: 5,
                right: getRightOffsetOfFrontLowerNode(carouselOffset),
                child: Image.asset(circleNode, scale: 3),
              ),
            ],
          );
        },
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Cards',
                  style: TextStyle(
                      fontSize: 50,
                      color: kTextColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 44),
            CardsCarousel(),
          ],
        ),
      ),
    );
  }
}
