import 'package:xvpn/feature/presentation/architecture/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class TabPage extends BasePage {
  const TabPage({super.key});

  // Свойства для табов
  SvgPicture buildTabIcon(BuildContext context);
  SvgPicture buildActiveTabIcon(BuildContext context);

  String get tabLabel;
  int get tabIndex;

  @override
  bool get showBackButton => false; // Табы обычно не имеют кнопки назад
}
