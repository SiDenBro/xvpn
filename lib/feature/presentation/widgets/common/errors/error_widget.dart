import 'package:xvpn/feature/presentation/widgets/common/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class XErrorWidget extends StatelessWidget {
  const XErrorWidget({
    super.key,
    required this.message,
    required this.close,
  });

  final String message;
  final Function close;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 128,
            height: 48,
            child: PrimaryButton(
              text: "Закрыть",
              onClick: () => close(),
            ),
          )
        ],
      ),
    );
  }
}
