import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:celeb_voice/widgets/auth/divider.dart';
import 'package:celeb_voice/widgets/auth/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: themeContext.textTheme.headlineLarge!.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            Text(
              "Create your account to continue",
              style: themeContext.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            Column(
              spacing: 15.h,
              children: [
                AuthInput(
                  labelText: "Username",
                  hintText: "Enter your username",
                ),
                AuthInput(
                  labelText: "Email",
                  hintText: "Enter your email address",
                ),
                AuthPasswordInput(
                  hintText: "Password",
                  labelText: "Enter your password",
                ),
              ],
            ),
            5.verticalSpace,
            ElevatedButton(onPressed: () {}, child: const Text("Register")),
            20.verticalSpace,
            ContinueDivider(type: "register"),
          ],
        ),
      ),
    );
  }
}
