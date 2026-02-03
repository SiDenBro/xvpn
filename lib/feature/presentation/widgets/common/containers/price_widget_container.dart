import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/icons.dart';

class PriceWidgetContainer extends StatelessWidget {
  final int price;
  final String title;
  final double height;

  const PriceWidgetContainer({
    required this.price,
    required this.title,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                XIcons.getIcon(
                  name: 'icon_price',
                  size: 24,
                  color: XColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
