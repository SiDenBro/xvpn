import 'package:xvpn/feature/data/models/premium_model.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/core/enums/premium_status.dart';
import 'package:xvpn/core/network/api_client.dart';
import 'package:intl/intl.dart';

abstract class PremiumRemoteDataSource {
  Future<PremiumModel> buyPremium(BuyPremiumTime premiumTime);
}

class PremiumRemoteDataSourceImpl implements PremiumRemoteDataSource {
  final ApiClient apiClient;

  PremiumRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<PremiumModel> buyPremium(BuyPremiumTime premiumTime) async {
    try {
      //final response = await apiClient.post('buy_premium');
      //return PremiumModel.fromJson(response);
      DateTime now = DateTime.now();
      late DateTime expireAt;

      switch (premiumTime) {
        case BuyPremiumTime.mounth:
          expireAt = DateTime(
            now.year,
            now.month + 1,
            now.day,
            now.hour,
            now.minute,
            now.second,
            now.millisecond,
            now.microsecond,
          );
          break;
        case BuyPremiumTime.year:
          expireAt = DateTime(
            now.year + 1,
            now.month,
            now.day,
            now.hour,
            now.minute,
            now.second,
            now.millisecond,
            now.microsecond,
          );
          break;
      }

      String formattedDate = DateFormat('dd.MM.yy').format(expireAt);

      return PremiumModel(
        status: PremiumStatus.activated,
        datetime: formattedDate,
      );
    } catch (e) {
      rethrow;
    }
  }
}
