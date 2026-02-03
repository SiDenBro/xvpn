import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/feature/data/datasources/local/premium_local_data_source.dart';

final premiumLocalDataSourceProvider = Provider<PremiumLocalDataSource>(
  (ref) => PremiumLocalDataSourceImpl(),
);
