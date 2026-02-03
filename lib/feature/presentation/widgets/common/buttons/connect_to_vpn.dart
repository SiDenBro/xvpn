import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/core/enums/connection.dart';
import 'package:flutter/material.dart';

class ConnectToVpn extends StatefulWidget {
  final ConnectionStatus connnectionStatus;

  const ConnectToVpn({
    required this.connnectionStatus,
    super.key,
  });

  @override
  State<ConnectToVpn> createState() => _ConnectToVpnState();
}

class _ConnectToVpnState extends State<ConnectToVpn>
    with TickerProviderStateMixin {
  late Widget backgroundContainer;

  @override
  Widget build(BuildContext context) {
    switch (widget.connnectionStatus) {
      case ConnectionStatus.disconnected:
        backgroundContainer = Container(
          height: 192,
          width: 192,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                XColors.primaryTextColor,
                XColors.primaryTextColor,
              ],
            ),
          ),
        );
        break;
      case ConnectionStatus.connecting:
        AnimationController _iconAnimationController;
        Animation<double> _iconAnimation;

        _iconAnimationController = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 1),
        );
        _iconAnimation = Tween<double>(
          begin: 0,
          end: 2 * 3.14159,
        ).animate(_iconAnimationController);
        _iconAnimationController.repeat();

        backgroundContainer = AnimatedBuilder(
          animation: _iconAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _iconAnimation.value,
              child: Container(
                height: 192,
                width: 192,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      XColors.primary,
                      XColors.primaryTextColor,
                    ],
                  ),
                ),
              ),
            );
          },
        );
        break;
      case ConnectionStatus.connected:
        backgroundContainer = Container(
          height: 192,
          width: 192,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                XColors.primary,
                XColors.primary,
              ],
            ),
          ),
        );
        break;
    }

    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        backgroundContainer,
        Container(
          height: 184,
          width: 184,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: XColors.cardColor,
          ),
          child: Icon(
            Icons.power_settings_new_rounded,
            size: 48,
            color: (widget.connnectionStatus == ConnectionStatus.connected)
                ? XColors.primary
                : XColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
