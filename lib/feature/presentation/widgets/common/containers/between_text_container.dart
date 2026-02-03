import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';

class BetweenTextContainer extends StatelessWidget {
  final String textLeft;
  final String textRight;
  final double height;

  const BetweenTextContainer({
    required this.textLeft,
    required this.textRight,
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
            Text(
              textLeft,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
            Text(
              textRight,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
