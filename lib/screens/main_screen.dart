import 'package:bank_app_ui/providers/card_carousel_offset_provider.dart';
import 'package:bank_app_ui/providers/scroll_controller_provider.dart';
import 'package:bank_app_ui/utils/assets.dart';
import 'package:bank_app_ui/utils/magic_numbers.dart';
import 'package:bank_app_ui/widgets/bottom_navbar.dart';
import 'package:bank_app_ui/widgets/cards_sliver.dart';
import 'package:bank_app_ui/widgets/details_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final carouselOffset = ref.watch(cardCarouselOffsetProvider);
            final height = MediaQuery.of(context).size.height;
            return Stack(
              children: [
                Positioned(
                  top: getTopOffsetOfBigNode(height, carouselOffset),
                  left: getLeftOffsetOfBigNode(carouselOffset),
                  child: Transform.rotate(
                    angle: -carouselOffset * 0.7,
                    child: Image.asset(bigCircleNode, scale: 0.6),
                  ),
                ),
                Positioned(
                  top: getTopOffsetOfSmallNode(height, carouselOffset),
                  right: getRightOffsetOfSmallNode(carouselOffset),
                  child: Image.asset(circleNode, scale: 1.0),
                ),
                child ?? const SizedBox.shrink(),
              ],
            );
          },
          child: SafeArea(
            child: Consumer(builder: (context, ref, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomScrollView(
                  controller: ref.watch(scrollControllerProvider),
                  physics: const ClampingScrollPhysics(),
                  slivers: const [CardSliver(), DetailsSliver()],
                ),
              );
            }),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}