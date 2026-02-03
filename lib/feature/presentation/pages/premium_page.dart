import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/feature/presentation/architecture/routable_page.dart';
import 'package:xvpn/feature/presentation/architecture/base_page.dart';
import 'package:flutter/material.dart';
import 'package:xvpn/feature/presentation/pages/buy_premium_page.dart';
import 'package:xvpn/feature/presentation/providers/special/premium_provider.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/between_text_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/premium_banner_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/premium_widget_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/price_widget_container.dart';

class PremiumPage extends RoutablePage {
  const PremiumPage({super.key});

  @override
  String get routeName => '/premium';

  @override
  bool get showBackButton => false;

  @override
  String title() => 'X VPN';

  @override
  BasePageState createState() => _PremiumPageState();
}

class _PremiumPageState extends BasePageState<PremiumPage>
    with TickerProviderStateMixin {
  @override
  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 250),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const PremiumWidgetContainer(),
              const SizedBox(height: 16),
              const PremiumBannerContainer(),
              const SizedBox(height: 16),
              Consumer(
                builder: (context, ref, child) {
                  final premiumState = ref.watch(premiumNotifierProvider);
                  return BetweenTextContainer(
                    textLeft: 'Статус',
                    textRight:
                        premiumState.isActivated ? 'активно до ${premiumState.datetime}' : 'Неактивно',
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Приобрести Premium',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => RoutablePage.push(
                  context,
                  const BuyPremiumPage(
                    buyPremiumTime: BuyPremiumTime.mounth,
                  ),
                ),
                child: const PriceWidgetContainer(
                  price: 10,
                  title: '1 месяц',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => RoutablePage.push(
                  context,
                  const BuyPremiumPage(
                    buyPremiumTime: BuyPremiumTime.year,
                  ),
                ),
                child: const PriceWidgetContainer(
                  price: 100,
                  title: '1 год',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
