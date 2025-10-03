import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:celeb_voice/screens/celeb_page.dart';
import 'package:celeb_voice/screens/home_screen.dart';
import 'package:celeb_voice/screens/forgot_password.dart';
import 'package:celeb_voice/screens/auth/login.dart';
import 'package:celeb_voice/screens/auth/register.dart';
import 'package:celeb_voice/screens/auth/reset_password.dart';
import 'package:celeb_voice/screens/auth/verify_otp.dart';
import 'package:celeb_voice/screens/welcome.dart';
import 'package:celeb_voice/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightMode(context),
          darkTheme: AppTheme.darkMode(context),
          onGenerateRoute: (RouteSettings e) {
            switch (e.name) {
              case "/":
                return getPage(widget: ResetPassword());
              case "/auth/login":
                return getPage(widget: LoginScreen());
              case "/auth/register":
                return getPage(widget: RegisterScreen());
              case "/auth/forgot-password":
                return getPage(widget: ForgotPasswordScreen());  
                case "/auth/verify-otp":
                return getPage(widget: VerifyOtpScreen());
              case "/auth/reset-password":
                return getPage(widget: ResetPassword());



              case "/home":
              return getPage(widget: HomeScreen());
              case "/celeb-page":
               final args = e.arguments as HomeCelebrityModel; 
                return getPage(widget: CelebPage(celeb:args));  
              default:
                return getPage(widget: WelcomeScreen());
            }
          },
        );
      },
    );
  }

  GetPageRoute<dynamic> getPage({required Widget widget}) {
    return GetPageRoute(
      page: () => widget,
      transition: Transition.cupertino,
      showCupertinoParallax: true,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
