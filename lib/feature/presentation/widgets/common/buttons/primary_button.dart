import 'package:flutter/material.dart';
import 'package:xvpn/utils/constants/sizes.dart';
import 'package:xvpn/utils/theme/custom_themes/extension.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onClick,
    this.customGradient,
  });

  final String text;
  final GestureTapCallback onClick;
  final Gradient? customGradient;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: XSizes.primaryButtonHeight,
          decoration: BoxDecoration(
              gradient: customGradient ??
                  Theme.of(context)
                      .extension<XExtension>()!
                      .primaryButtonGradient,
              borderRadius: BorderRadius.circular(XSizes.buttonBorderRadius)),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .extension<XExtension>()!
                  .primaryButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
