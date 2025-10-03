import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.arrow_back_ios_new, size: 20),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          // spacing: 5.h,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.verticalSpace,
            Text(
              "Forgot Password",
              style: themeContext.textTheme.headlineSmall!.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            5.verticalSpace,
            Text(
              "Please enter your email address",
              style: themeContext.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.onPrimaryContainer,
              ),
              // textAlign: TextAlign.center,
            ),
            30.verticalSpace,
            Column(
              spacing: 15.h,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () => Get.toNamed("/auth/verify-otp"),
              child: Text("Send code"),
            ),
          ],
        ),
      ),
    );
  }
}
