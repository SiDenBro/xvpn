import 'package:xvpn/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class XTextFormField extends StatelessWidget {
  const XTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.height,
    this.floatingLabel,
    this.onChanged,
    this.expands = false, // Добавим параметр
    this.maxLines = 1, // И этот
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final double? height;
  final bool? floatingLabel;
  final Function(String)? onChanged;
  final bool expands; // Новый параметр
  final int? maxLines; // Новый параметр

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? XSizes.textFieldHeight,
      child: TextFormField(
        controller: controller,
        expands: expands, // Используем параметр
        maxLines: expands ? null : maxLines, // Условная логика
        onChanged: onChanged,
        textAlignVertical:
            expands ? TextAlignVertical.top : TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: (floatingLabel == false)
              ? FloatingLabelBehavior.never
              : FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
