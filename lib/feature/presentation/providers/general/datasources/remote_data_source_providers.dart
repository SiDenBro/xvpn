import 'package:xvpn/feature/data/datasources/remote/premium_remote_data_source.dart';
import 'package:xvpn/feature/presentation/providers/general/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final premiumRemoteDataSourceProvider = Provider<PremiumRemoteDataSource>(
  (ref) => PremiumRemoteDataSourceImpl(apiClient: ref.read(apiClientProvider)),
);
