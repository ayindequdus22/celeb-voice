import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:celeb_voice/widgets/auth/divider.dart';
import 'package:celeb_voice/widgets/auth/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Text(
                "Login",
                style: themeContext.textTheme.headlineLarge?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              10.verticalSpace,
              Text(
                "Welcome back! we missed you",
                style: themeContext.textTheme.titleLarge!.copyWith(
                  color: context.theme.colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              Column(
                spacing: 15.h,
                children: [
                  AuthInput(
                    labelText: "Email",
                    hintText: "Enter your email address",
                  ),
                  AuthPasswordInput(
                    hintText: "Password",
                    labelText: "Enter your password",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed("/auth/forgot-password"),
                        child: Text(
                          "Forgot Password?",
                          style: themeContext.textTheme.labelLarge!.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              5.verticalSpace,
              ElevatedButton(onPressed: () {}, child: const Text("Login")),
              20.verticalSpace,
              ContinueDivider(type: "login"),
            ],
          ),
        ),
      ),
    );
  }
}
