import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/feature/domain/entities/premium_entity.dart';
import 'package:xvpn/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PremiumRepository {
  Future<Either<Failure, PremiumEntity>> buyPremium(BuyPremiumTime premiumTime);
}
