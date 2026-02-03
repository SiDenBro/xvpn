import 'package:xvpn/core/enums/premium_status.dart';
import 'package:xvpn/feature/domain/entities/premium_entity.dart';

class PremiumModel {
  final PremiumStatus status;
  final String? datetime;

  const PremiumModel({
    required this.status,
    this.datetime,
  });

  PremiumEntity toEntity() => PremiumEntity(
        status: status,
        datetime: datetime,
      );

  String mapStatusToString() {
    switch (status) {
      case PremiumStatus.activated:
        return 'activated';
      case PremiumStatus.inactivated:
        return 'inactivated';
    }
  }

  static PremiumStatus mapStringToStatus(String str) {
    if (str == 'activated') return PremiumStatus.activated;
    return PremiumStatus.inactivated;
  }
}
