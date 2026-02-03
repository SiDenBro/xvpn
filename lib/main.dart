import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:xvpn/app.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('premium_status');
  await Hive.openBox('premium_datetime');

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
