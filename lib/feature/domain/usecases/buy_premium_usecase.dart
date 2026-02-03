import 'package:xvpn/feature/domain/repositories/premium_repository.dart';
import 'package:xvpn/feature/domain/entities/premium_entity.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class BuyPremiumUsecase {
  final PremiumRepository repository;

  BuyPremiumUsecase(this.repository);

  Future<Either<Failure, PremiumEntity>> call(BuyPremiumTime premiumTime) =>
      repository.buyPremium(premiumTime);
}
