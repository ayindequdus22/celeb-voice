import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContinueDivider extends StatelessWidget {
  const ContinueDivider({super.key, required this.type});

  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                // thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Or continue with ",
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                // thickness: 1,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.w,
          children: [
            Image(image: AssetImage("assets/images/apple.png"), height: 25.h),
            Image(image: AssetImage("assets/images/google.png"), height: 25.h),
            Image(
              image: AssetImage("assets/images/facebook.png"),
              height: 25.h,
            ),
          ],
        ),
        type == "login"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => Get.toNamed("/auth/register"),
                    child: const Text("Sign up"),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Get.toNamed("/auth/login"),
                    child: const Text("Sign in"),
                  ),
                ],
              ),
      ],
    );
  }
}
