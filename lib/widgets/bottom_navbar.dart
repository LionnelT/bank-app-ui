import 'package:bank_app_ui/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteBg,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kPrimaryTextColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  cardIcon,
                  // ignore: deprecated_member_use
                  color: kSecondaryColor,
                ),
              ),
              label: 'My cards',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  paymentsIcon,
                ),
              ),
              label: 'Payments',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  transfersIcon,
                ),
              ),
              label: 'Transfers',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(profileIcon),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
