import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Celeb Voice",
                style: themeContext.textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              20.verticalSpace,
              Text(
                "Experience the voice of your favorite celebrities like never before.",
                style: themeContext.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              10.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/auth/login");
                },
                child: Text("Login"),
              ),

              10.verticalSpace,
              Row(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(213, 255, 255, 255),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed("/auth/register"),
                        child: Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
