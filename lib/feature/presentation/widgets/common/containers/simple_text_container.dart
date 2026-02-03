import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';

class SimpleTextContainer extends StatelessWidget {
  final String text;
  final double height;

  const SimpleTextContainer({
    required this.text,
    this.height = 48,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
