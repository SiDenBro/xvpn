import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/icons.dart';

class BuyPremiumButton extends StatelessWidget {
  const BuyPremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                XIcons.getIcon(
                  name: 'icon_transaction',
                  size: 24,
                  color: XColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Продолжить',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            XIcons.getIcon(
              name: 'icon_arrow_right',
              size: 20,
              color: XColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
