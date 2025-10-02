import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CelebPage extends StatelessWidget {
  const CelebPage({super.key, required this.celeb});
  final HomeCelebrityModel celeb;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: celeb.image,
                  child: Image(image: AssetImage(celeb.image)),
                ),
                Positioned(
                  top: 4.h,
                  left: 10.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(CupertinoIcons.back),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
