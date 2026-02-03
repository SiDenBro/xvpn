import 'package:xvpn/feature/presentation/architecture/base_page.dart';

abstract class ModalPage extends BasePage {
  const ModalPage({super.key});

  /// Полноэкранная модальная страница
  /// Используется для определения типа анимации при навигации
  bool get fullScreen => true;

  /// Можно закрыть свайпом/кнопкой назад
  /// Влияет на поведение жестов закрытия
  bool get canDismiss => true;

  /// Модальные страницы обычно скрывают BottomNavigationBar
  /// Переопределяем поведение по умолчанию из BasePage
  @override
  bool get showBackButton => true;
}
