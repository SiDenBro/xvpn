import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/icons.dart';

class PremiumWidgetContainer extends StatelessWidget {
  final double height;

  const PremiumWidgetContainer({
    this.height = 48,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XIcons.getIcon(
              name: 'icon_premium',
              size: 24,
              color: XColors.premiumColor,
            ),
            Text(
              'Premium',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: XColors.premiumColor,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            XIcons.getIcon(
              name: 'icon_premium',
              size: 24,
              color: XColors.premiumColor,
            ),
          ],
        ),
      ),
    );
  }
}
