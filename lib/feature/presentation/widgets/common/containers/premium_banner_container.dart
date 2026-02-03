import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';

class PremiumBannerContainer extends StatelessWidget {
  const PremiumBannerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/banners/banner_premium.png'), // из assets
          fit: BoxFit.cover, // заполнение контейнера
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.premiumColor),
      ),
      
    );
  }
}