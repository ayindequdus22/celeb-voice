import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
          spacing: 10.h,
          children: [
            20.verticalSpace,
            Text(
              "Verify OTP",
              style: themeContext.textTheme.headlineSmall!.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            Text(
              "OTP has been sent to your mail",
              style: themeContext.textTheme.bodyMedium!.copyWith(
                color: context.theme.colorScheme.onPrimaryContainer,
              ),
            ),
            30.verticalSpace,
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              }, // end onSubmit
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed("/auth/reset-password"),
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
