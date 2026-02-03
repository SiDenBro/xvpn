import 'dart:async';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/icons.dart';
import 'package:xvpn/core/enums/connection.dart';
import 'package:flutter/material.dart';

class ConnectionStatusContainer extends StatefulWidget {
  final ConnectionStatus connnectionStatus;
  final double height;

  const ConnectionStatusContainer({
    required this.connnectionStatus,
    this.height = 48,
    super.key,
  });

  @override
  State<ConnectionStatusContainer> createState() =>
      _ConnectionStatusContainerState();
}

class _ConnectionStatusContainerState extends State<ConnectionStatusContainer>
    with TickerProviderStateMixin {
  late String title = '';
  late Widget icon;
  Timer? _timer;
  Duration _connectionDuration = Duration.zero;
  DateTime? _connectionStartTime;
  AnimationController? _iconAnimationController;
  Animation<double>? _iconAnimation;

  @override
  void initState() {
    super.initState();
    _handleStatusChange();
  }

  @override
  void didUpdateWidget(ConnectionStatusContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Если статус изменился
    if (oldWidget.connnectionStatus != widget.connnectionStatus) {
      _handleStatusChange();
    }
  }

  void _handleStatusChange() {
    // Останавливаем предыдущий таймер
    _stopTimer();

    // Сбрасываем анимацию
    _iconAnimationController?.dispose();
    _iconAnimationController = null;

    // В зависимости от статуса
    switch (widget.connnectionStatus) {
      case ConnectionStatus.disconnected:
        _connectionDuration = Duration.zero;
        _connectionStartTime = null;
        break;

      case ConnectionStatus.connecting:
        _initConnectingAnimation();
        break;

      case ConnectionStatus.connected:
        // Запоминаем время начала подключения
        _connectionStartTime = DateTime.now();
        _connectionDuration = Duration.zero;
        _startTimer();
        break;
    }
  }

  void _initConnectingAnimation() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _iconAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(_iconAnimationController!);
    _iconAnimationController!.repeat();
  }

  void _startTimer() {
    // Останавливаем предыдущий таймер если есть
    _timer?.cancel();

    // Запускаем новый таймер
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_connectionStartTime != null) {
            // Вычисляем продолжительность подключения
            _connectionDuration =
                DateTime.now().difference(_connectionStartTime!);
          }
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  // Форматирование времени в чч:мм:сс
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }

  @override
  void dispose() {
    _stopTimer();
    _iconAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.connnectionStatus) {
      case ConnectionStatus.disconnected:
        title = 'Не подключено';
        icon = XIcons.getIcon(
          name: 'icon_connnection_disconnected',
          size: 24,
          color: XColors.primary,
        );
        break;
      case ConnectionStatus.connecting:
        title = 'Обработка сети...';
        icon = _iconAnimationController != null && _iconAnimation != null
            ? AnimatedBuilder(
                animation: _iconAnimation!,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _iconAnimation!.value,
                    child: XIcons.getIcon(
                      name: 'icon_connnection_connecting',
                      size: 24,
                      color: XColors.primary,
                    ),
                  );
                },
              )
            : XIcons.getIcon(
                name: 'icon_connnection_connecting',
                size: 24,
                color: XColors.primary,
              );
        break;
      case ConnectionStatus.connected:
        title = 'Подключено';
        icon = XIcons.getIcon(
          name: 'icon_connnection_connected',
          size: 24,
          color: XColors.primary,
        );
        break;
    }

    return Container(
      height: widget.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: XColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: XColors.borderColor),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            if (widget.connnectionStatus == ConnectionStatus.connected) ...[
              Text(
                _formatDuration(_connectionDuration),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                textAlign: TextAlign.end,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
