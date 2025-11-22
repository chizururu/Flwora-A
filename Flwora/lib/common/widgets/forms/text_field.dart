import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final bool hasPassword;
  final bool enableToggleVisibility;
  final String? errorMessage;
  final bool enabled;

  const TTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.errorMessage,
    this.enabled = true,
  }) : hasPassword = false,
        enableToggleVisibility = false;

  // Constructor untuk email field
  const TTextFormField.email({
    super.key,
    required this.controller,
    required this.label,
    this.errorMessage,
    this.enabled = true,
  }) : keyboardType = TextInputType.emailAddress,
        hasPassword = false,
        enableToggleVisibility = false;

  // Constructor untuk password field
  const TTextFormField.password({
    super.key,
    required this.controller,
    required this.label,
    this.errorMessage,
    this.enabled = true,
  }) : keyboardType = TextInputType.visiblePassword,
        hasPassword = true,
        enableToggleVisibility = true;

  @override
  Widget build(BuildContext context) {
    final inputController = Get.put(TextFormController(), tag: label);

    return (enableToggleVisibility && hasPassword)
        ? Obx(() {
      final isHidden = inputController.hidePassword.value;

      return TextFormField(
        controller: controller,
        obscureText: isHidden,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorMessage,
          suffixIcon: IconButton(
            onPressed: inputController.hidePassword.toggle,
            icon: Icon(
              isHidden ? Icons.visibility_off_outlined : Icons.visibility,
            ),
          ),
        ),
      );
    })
        : TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorMessage,
      ),
    );
  }
}

class TextFormController extends GetxController {
  final hidePassword = true.obs;
}
