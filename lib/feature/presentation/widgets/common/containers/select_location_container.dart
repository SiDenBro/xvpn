import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/icons.dart';

class SelectLocationContainer extends StatelessWidget {
  const SelectLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(left: 8),
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/countries/img_country_usa.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Text(
                'США',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          XIcons.getIcon(
            name: 'icon_arrow_right',
            size: 20,
            color: XColors.primaryTextColor,
          ),
        ],
      ),
    );
  }
}
