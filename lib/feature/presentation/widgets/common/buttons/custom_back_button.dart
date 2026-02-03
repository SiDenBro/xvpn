import 'package:xvpn/utils/theme/custom_themes/extension.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              Theme.of(context).extension<XExtension>()!.primaryButtonGradient,
        ),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20, // Немного меньше стандартного
        ),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
