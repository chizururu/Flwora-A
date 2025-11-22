import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/buttons/primary_button.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/features/authentication/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email
          Obx(
            () => TTextFormField.email(
              controller: controller.email,
              label: 'Email',
              errorMessage: controller.errors.value?['email']?.first,
            ),
          ),

          const SizedBox(height: 20),

          // Password
          Obx(
            () => TTextFormField.password(
              controller: controller.password,
              label: 'Password',
              errorMessage: controller.errors.value?['password']?.first,
            ),
          ),
          const SizedBox(height: 20),

          // Login
          Obx(() =>
              TPrimaryButton(text: 'Login',
                onPressed: () => controller.login(),
                isLoading: controller.isLoading.value,)),
        ],
      ),
    );
  }
}
