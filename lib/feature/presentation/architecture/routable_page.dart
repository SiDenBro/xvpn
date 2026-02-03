import 'package:flutter/material.dart';
import 'base_page.dart';

abstract class RoutablePage extends BasePage {
  const RoutablePage({super.key});

  /// Параметры маршрута для глубоких ссылок
  Map<String, dynamic> get routeParams => {};

  /// Аргументы для передачи через Navigator
  Object? get arguments => null;

  static Future<T?> pushOptimized<T>(BuildContext context, RoutablePage page) {
    //final theme = Theme.of(context);

    return Navigator.push(
      context,
      MaterialPageRoute(
        // ✅ MaterialPageRoute сам обо всем позаботится
        builder: (context) => page,
      ),
    );
  }

  /// Статический метод для навигации с возвратом результата
  static Future<T?> push<T>(BuildContext context, RoutablePage page) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(
          name: page.routeName,
          arguments: page.arguments,
        ),
      ),
    );
  }

  /// Замена текущей страницы
  static Future<T?> pushReplacement<T>(
      BuildContext context, RoutablePage page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(
          name: page.routeName,
          arguments: page.arguments,
        ),
      ),
    );
  }

  /// Закрытие с возвратом результата
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
