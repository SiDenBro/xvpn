import 'package:xvpn/feature/presentation/pages/misc_pages/loading_page.dart';
import 'package:xvpn/feature/presentation/providers/special/premium_provider.dart';
import 'package:xvpn/feature/presentation/app/onboarding_flow.dart';
import 'package:xvpn/feature/presentation/app/general_flow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumState = ref.watch(premiumNotifierProvider);

    if (premiumState.loading) return const LoadingPage();

    return premiumState.isActivated ? const GeneralFlow() : const OnboardingFlow();
  }
}
