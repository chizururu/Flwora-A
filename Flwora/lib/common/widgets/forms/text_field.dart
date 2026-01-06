import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool obscurable;
  final bool enabled;

  const TTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.errorText,
    this.obscurable = false,
    this.enabled = true,
  });

  const TTextFormField.email({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.enabled = true,
  }) : keyboardType = TextInputType.emailAddress,
       obscurable = false;

  const TTextFormField.password({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.enabled = true,
  }) : keyboardType = TextInputType.visiblePassword,
       obscurable = true;

  @override
  Widget build(BuildContext context) {
    final visibilityController = Get.put(TextVisibilityController());

    return obscurable
        ? Obx(
            () => TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: visibilityController.isObscured.value,
              decoration: InputDecoration(
                labelText: labelText,
                errorText: errorText,
                suffixIcon: IconButton(
                  onPressed: visibilityController.toggleObscure,
                  icon: Icon(
                    visibilityController.isObscured.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
          )
        : TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              errorText: errorText,
            ),
          );
  }
}

class TextVisibilityController extends GetxController {
  final RxBool isObscured = true.obs;

  void toggleObscure() => isObscured.toggle();
}
