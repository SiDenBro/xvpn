import 'package:flutter/material.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/utils/constants/colors.dart';

class BuyPremiumTextContainer extends StatelessWidget {
  final BuyPremiumTime buyPremiumTime;

  const BuyPremiumTextContainer({
    required this.buyPremiumTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String time;
    int price;

    switch (buyPremiumTime) {
      case BuyPremiumTime.mounth:
        time = '1 месяц';
        price = 10;
        break;
      case BuyPremiumTime.year:
        time = '1 год';
        price = 100;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Column(
        children: [
          Text(
            'Приобрести Premium',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Вы собираетесь приобрести Premium на $time',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Сумма: ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '\$$price',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: XColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Вы собираетесь приобрести Premium на 1 месяц',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
