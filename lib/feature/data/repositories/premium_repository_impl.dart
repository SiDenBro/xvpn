
import 'package:dartz/dartz.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/core/errors/exception.dart';
import 'package:xvpn/core/errors/failure.dart';
import 'package:xvpn/feature/data/datasources/local/premium_local_data_source.dart';
import 'package:xvpn/feature/data/datasources/remote/premium_remote_data_source.dart';
import 'package:xvpn/feature/domain/entities/premium_entity.dart';
import 'package:xvpn/feature/domain/repositories/premium_repository.dart';

class PremiumRepositoryImpl implements PremiumRepository {
  final PremiumRemoteDataSource remoteDataSource;
  final PremiumLocalDataSource localDataSource;

  PremiumRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, PremiumEntity>> buyPremium(BuyPremiumTime premiumTime) async {
    try {
      final model = await remoteDataSource.buyPremium(premiumTime);
      await localDataSource.savePremium(model);
      return Right(model.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
