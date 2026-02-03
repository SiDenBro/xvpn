import 'package:xvpn/core/enums/premium_status.dart';

class PremiumEntity {
  final PremiumStatus status;
  final String? datetime;

  const PremiumEntity({
    required this.status,
    this.datetime,
  });
}
