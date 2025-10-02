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
    final themeContext = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.r),
                  ),
                  child: Hero(
                    tag: celeb.image,
                    child: Image(
                      image: AssetImage(celeb.image),
                      height: ScreenUtil().screenHeight / 2.5,
                      fit: BoxFit.fitWidth,
                      alignment: AlignmentGeometry.topCenter,
                      width: ScreenUtil().screenWidth,
                    ),
                  ),
                ),
                Positioned(
                  top: 4.h,
                  left: 0,
                  width: ScreenUtil().screenWidth,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Get.back(),
                          icon: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        PopupMenuButton<String>(
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.more_vert_rounded,
                              color: Colors.white,
                            ),
                          ),
                          onSelected: (value) {
                            // Handle menu selection
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: 'settings',
                              child: Text('Settings'),
                            ),
                            PopupMenuItem(
                              value: 'logout',
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: themeContext.colorScheme.onSecondary,
                spreadRadius: 1, // Spread radius
                blurRadius: 3, // Blur radius
                offset: Offset(0, 3), // Shadow position (x, y)
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.h),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(),
            child: Text("Chat with him"),
          ),
        ),
      ),
    );
  }
}
