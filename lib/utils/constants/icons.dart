import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class XIcons {
  XIcons._();

  static SvgPicture getIcon({
    required String name,
    required double size,
    required Color? color,
  }) {
    try {
      if (_iconsNames.contains(name)) {
        return SvgPicture.asset(
          'assets/icons/$name.svg',
          width: size,
          height: size,
          color: color,
        );
      } else {
        throw Exception('Icon $name not found');
      }
    } on Exception {
      throw Exception('Icon $name not found');
    }
  }

  static const Set<String> _iconsNames = {
    // [ Connection ]
    'icon_connnection_disconnected',
    'icon_connnection_connecting',
    'icon_connnection_connected',
    'icon_transaction',
    'icon_arrow_right',
    'icon_arrow_down',
    'icon_premium',
    'icon_price',
  };
}
