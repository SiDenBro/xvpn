import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xvpn/core/enums/connection.dart';
import 'package:xvpn/feature/presentation/architecture/base_page.dart';
import 'package:flutter/material.dart';
import 'package:xvpn/feature/presentation/architecture/routable_page.dart';
import 'package:xvpn/feature/presentation/pages/premium_page.dart';
import 'package:xvpn/feature/presentation/providers/special/connection_vpn_provider.dart';
import 'package:xvpn/feature/presentation/widgets/common/buttons/connect_to_vpn.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/between_text_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/connection_status_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/need_work_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/premium_widget_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/select_location_container.dart';
import 'package:xvpn/feature/presentation/widgets/common/containers/simple_text_container.dart';

class MainPage extends BasePage {
  const MainPage({super.key});

  @override
  String get routeName => '/';

  @override
  String title() => "X VPN";

  @override
  bool get showBackButton => false;

  @override
  BasePageState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends BasePageState<BasePage>
    with TickerProviderStateMixin {
  late AnimationController _verifLogoAnimationController;
  late AnimationController _arrowsAnimationController;

  @override
  void initState() {
    super.initState();
    _verifLogoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // Это делает анимацию цикличной
    _arrowsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // Это делает анимацию цикличной
  }

  @override
  void dispose() {
    _verifLogoAnimationController.dispose();
    _arrowsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent() {
    final connectionState = ref.watch(connectioNotifierProvider);
    final connectionNotifier = ref.read(connectioNotifierProvider.notifier);

    String currentIP;
    if (connectionState.connectionStatus == ConnectionStatus.connected) {
      currentIP = '127.0.0.1';
    } else if (connectionState.connectionStatus ==
        ConnectionStatus.connecting) {
      currentIP = 'обработка сети';
    } else {
      currentIP = 'ожидает подключения';
    }
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
              const SimpleTextContainer(
                text: 'Выберите локацию подключения',
              ),
              const SizedBox(height: 16),
              const SelectLocationContainer(),
              const SizedBox(height: 16),
              BetweenTextContainer(
                textLeft: 'Текущий IP:',
                textRight: currentIP,
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  _connectToVpn(
                      connectionState.connectionStatus, connectionNotifier);
                },
                child: ConnectToVpn(
                    connnectionStatus: connectionState.connectionStatus),
              ),
              const SizedBox(height: 32),
              ConnectionStatusContainer(
                connnectionStatus: connectionState.connectionStatus,
              ),
              const SizedBox(height: 16),
              const NeedWorkContainer(),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => RoutablePage.push(context, const PremiumPage()),
                child: const PremiumWidgetContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _connectToVpn(
    ConnectionStatus connectionStatus,
    ConnectionNotifier connectionNotifier,
  ) {
    switch (connectionStatus) {
      case ConnectionStatus.disconnected:
        connectionNotifier.connect();
        break;
      case ConnectionStatus.connected:
        connectionNotifier.disconnect();
        break;
      case ConnectionStatus.connecting:
        break;
    }
  }
}
