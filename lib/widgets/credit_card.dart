import 'dart:ui';

import 'package:bank_app_ui/utils/assets.dart';
import 'package:bank_app_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardModel {
  final int cardNumber;
  final double balance;
  final DateTime expiryDate;

  const CreditCardModel({
    required this.cardNumber,
    required this.balance,
    required this.expiryDate,
  });
}

class CreditCard extends StatelessWidget {
  final CreditCardModel card;

  const CreditCard({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kLightPrimaryColor,
            border: Border.all(color: Colors.white.withAlpha(30)),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Current Balance',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: kPrimaryTextColor,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                formatBalance(card.balance),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                obscureCardNumber(card.cardNumber.toString()),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  letterSpacing: 3,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    const Shadow(
                      color: kPrimaryTextColor,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dateToExpiry(card.expiryDate),
                      style: const TextStyle(
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            color: kPrimaryTextColor,
                            offset: Offset(0, 2),
                            // blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(mastercardIcon),
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
