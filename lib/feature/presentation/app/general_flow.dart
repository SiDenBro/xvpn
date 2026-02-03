import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/feature/presentation/pages/main_page.dart';

class GeneralFlow extends ConsumerStatefulWidget {
  const GeneralFlow({super.key});

  @override
  ConsumerState<GeneralFlow> createState() => _GeneralFlowState();
}

class _GeneralFlowState extends ConsumerState<GeneralFlow> {
  @override
  Widget build(BuildContext context) => const MainPage();
}
