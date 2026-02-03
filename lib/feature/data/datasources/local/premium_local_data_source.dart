import 'package:xvpn/core/enums/premium_status.dart';
import 'package:xvpn/feature/data/models/premium_model.dart';
import 'package:xvpn/core/errors/exception.dart';
import 'package:hive/hive.dart';

abstract class PremiumLocalDataSource {
  Future<void> savePremium(PremiumModel model);
  Future<PremiumModel> getPremiumData();
}

class PremiumLocalDataSourceImpl implements PremiumLocalDataSource {
  @override
  Future<void> savePremium(PremiumModel model) async {
    print("1ew");
    try {
      final boxStatus = Hive.box('premium_status');
      final boxDatetime = Hive.box('premium_datetime');
      print('234rw');
      if (!boxStatus.containsKey('premium_status')) {
        final status = model.mapStatusToString();
        await boxStatus.put('premium_status', status);
        print(status);
      }
      if (!boxDatetime.containsKey('premium_datetime')) {
        final datetime = model.datetime;
        await boxDatetime.put('premium_datetime', datetime);
        print(boxDatetime);
      }
    } catch (e) {
      print(e);
      throw const StorageException('Ошибка: 0x9274');
    }
  }

  @override
  Future<PremiumModel> getPremiumData() async {
    try {
      final boxStatus = Hive.box('premium_status');
      final boxDatetime = Hive.box('premium_datetime');

      String? datetime = boxDatetime.get('premium_datetime');
      PremiumStatus status = (boxStatus.containsKey('premium_status'))
          ? PremiumModel.mapStringToStatus(boxStatus.get('premium_status'))
          : PremiumStatus.inactivated;

      return PremiumModel(
        status: status,
        datetime: datetime,
      );
    } catch (e) {
      throw const StorageException('Ошибка: 0x9275');
    }
  }
}
