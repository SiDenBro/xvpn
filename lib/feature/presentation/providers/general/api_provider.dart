import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/core/network/dio_client.dart';

final apiClientProvider = Provider<DioClient>(
  (ref) => DioClient(),
);
