import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/buttons/primary_button.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/features/authentication/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Name
          Obx(
            () => TTextFormField(
              controller: controller.name,
              label: "Name",
              errorMessage: controller.errors.value?['name']?.first,
            ),
          ),
          const SizedBox(height: 20),

          // Email
          Obx(
            () => TTextFormField.email(
              controller: controller.email,
              label: "Email",
              errorMessage: controller.errors.value?['email']?.first,
            ),
          ),
          const SizedBox(height: 20),
          // Password
          Obx(
            () => TTextFormField.password(
              controller: controller.password,
              label: "Password",
              errorMessage: controller.errors.value?['password']?.first,
            ),
          ),
          const SizedBox(height: 20),
          // Confirm Password
          Obx(
            () => TTextFormField.password(
              controller: controller.confirmPassword,
              label: "Confirm Password",
              errorMessage: controller.errors.value?['confirm_password']?.first,
            ),
          ),
          const SizedBox(height: 20),

          // Register
          Obx(
            () => TPrimaryButton(
              text: 'Register',
              onPressed: () => controller.register(),
              isLoading: controller.isLoading.value,
            ),
          ),
        ],
      ),
    );
  }
}
