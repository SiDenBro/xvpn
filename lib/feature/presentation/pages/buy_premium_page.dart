import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/feature/presentation/providers/special/premium_provider.dart';
import 'package:xvpn/feature/presentation/widgets/common/buttons/buy_premium_button.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/buy_premium_text_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/premium_widget_container.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xvpn/feature/presentation/architecture/routable_page.dart';
import 'package:xvpn/feature/presentation/architecture/base_page.dart';
import 'package:flutter/material.dart';

class BuyPremiumPage extends RoutablePage {
  final BuyPremiumTime buyPremiumTime;

  const BuyPremiumPage({
    required this.buyPremiumTime,
    super.key,
  });

  @override
  String get routeName => '/premium/buy';

  @override
  bool get showBackButton => false;

  @override
  String title() => 'X VPN';

  @override
  BasePageState createState() => _BuyPremiumPageState();
}
class _BuyPremiumPageState extends BasePageState<BuyPremiumPage>
    with TickerProviderStateMixin {
  @override
  Widget buildContent() {
    return Consumer(  // Добавляем Consumer для работы с ref
      builder: (context, ref, child) {
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
                  BuyPremiumTextContainer(buyPremiumTime: widget.buyPremiumTime),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _buyPremium(ref),  // Вызываем метод с передачей ref
                    child: const BuyPremiumButton(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _buyPremium(WidgetRef ref) async {
    try {
      // Показываем индикатор загрузки
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(width: 16),
              Text('Обработка покупки...'),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );

      // Получаем notifier и вызываем метод покупки
      final premiumNotifier = ref.read(premiumNotifierProvider.notifier);
      await premiumNotifier.buyPremium(widget.buyPremiumTime);

      // Показываем успешное сообщение
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Премиум активирован успешно!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Возвращаемся на предыдущую страницу
      Navigator.pop(context);
      
    } catch (e) {
      // Обработка ошибки
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при покупке: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}