import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/colors.dart';

class NeedWorkContainer extends StatelessWidget {
  const NeedWorkContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/banners/banner_need_work.png'), // из assets
          fit: BoxFit.cover, // заполнение контейнера
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.premiumColor),
      ),
      child: Center(
        child: Text(
          'МНЕ НУЖНА РАБОТА',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: XColors.premiumColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
