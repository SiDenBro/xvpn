import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/core/enums/buy_premium_time.dart';
import 'package:xvpn/core/enums/premium_status.dart';
import 'package:xvpn/feature/data/models/premium_model.dart';
import 'package:xvpn/feature/domain/usecases/buy_premium_usecase.dart';
import 'package:xvpn/feature/presentation/providers/general/datasources/local_data_source_providers.dart';
import 'package:xvpn/feature/presentation/providers/general/repositories_providers.dart';

final buyPremiumUsecaseProvider = Provider<BuyPremiumUsecase>(
  (ref) => BuyPremiumUsecase(ref.read(premiumRepositoryProvider)),
);

final premiumNotifierProvider = NotifierProvider<PremiumNotifier, PremiumState>(
  PremiumNotifier.new,
);

class PremiumState {
  final bool isActivated;
  final String? datetime;
  final bool loading;

  PremiumState({
    required this.isActivated,
    required this.loading,
    this.datetime,
  });

  PremiumState.activate(String premiumDatetime)
      : isActivated = true,
        loading = false,
        datetime = premiumDatetime;

  PremiumState.inactivate()
      : isActivated = false,
        loading = false,
        datetime = null;

  PremiumState.loading()
      : isActivated = false,
        loading = true,
        datetime = null;

  PremiumState copyWith({
    bool? isActivated,
    String? datetime,
    bool? loading,
  }) {
    return PremiumState(
      isActivated: isActivated ?? this.isActivated,
      datetime: datetime ?? this.datetime,
      loading: loading ?? this.loading,
    );
  }
}

class PremiumNotifier extends Notifier<PremiumState> {
  BuyPremiumUsecase get _buyPremium => ref.read(buyPremiumUsecaseProvider);

  @override
  PremiumState build() {
    _checkPremiumStatus();
    return PremiumState.loading();
  }

  Future<void> _checkPremiumStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final PremiumModel premiumData =
        await ref.read(premiumLocalDataSourceProvider).getPremiumData();
    print(premiumData.status);
    state = (premiumData.status == PremiumStatus.activated)
        ? PremiumState.activate(premiumData.datetime!)
        : PremiumState.inactivate();
  }

  Future<void> buyPremium(BuyPremiumTime premiumTime) async {
    PremiumState.loading();
    final result = await _buyPremium.call(premiumTime);

    result.fold(
      (failure) => state = PremiumState.inactivate(),
      (premiumEntity) => state = PremiumState.activate(premiumEntity.datetime!),
    );
  }
}
