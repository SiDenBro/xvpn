
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/feature/data/repositories/premium_repository_impl.dart';
import 'package:xvpn/feature/domain/repositories/premium_repository.dart';
import 'package:xvpn/feature/presentation/providers/general/datasources/local_data_source_providers.dart';
import 'package:xvpn/feature/presentation/providers/general/datasources/remote_data_source_providers.dart';

final premiumRepositoryProvider = Provider<PremiumRepository>(
  (ref) => PremiumRepositoryImpl(
    remoteDataSource: ref.read(premiumRemoteDataSourceProvider),
    localDataSource: ref.read(premiumLocalDataSourceProvider),
  ),
);

