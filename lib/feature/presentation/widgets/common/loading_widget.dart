import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class XLoadingWidget extends StatelessWidget {
  const XLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: SpinKitCircle(
          color: theme.primaryColor,
          size: 64.0,
        ),
      ),
    );
  }
}
