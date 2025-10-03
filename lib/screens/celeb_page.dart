import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CelebPage extends StatefulWidget {
  const CelebPage({super.key, required this.celeb});
  final HomeCelebrityModel celeb;

  @override
  State<CelebPage> createState() => _CelebPageState();
}

class _CelebPageState extends State<CelebPage> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    print(isFollowed);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      tag: widget.celeb.image,
                      child: Image(
                        image: AssetImage(widget.celeb.image),
                        height: ScreenUtil().screenHeight / 2.4,
                        fit: BoxFit.fitWidth,
                        alignment: AlignmentGeometry.topCenter,
                        width: ScreenUtil().screenWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
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
                            tooltip: "More Options",
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
                              popupMenuItem(value: "share", title: "Share"),
                              popupMenuItem(title: "Report", value: "report"),
                              popupMenuItem(value: "block", title: "Block"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.celeb.name,
                          style: themeContext.textTheme.titleLarge!.copyWith(
                            color: themeContext.colorScheme.primary,
                          ),
                        ),
                        10.horizontalSpace,

                    isFollowed ?ElevatedButton(onPressed: (){}, child: Text("Following"), style: ElevatedButton.styleFrom(backgroundColor: themeContext.colorScheme.primary),):  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            minimumSize: Size(10.w, 30.h),

                            side: BorderSide(
                              color: themeContext.colorScheme.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () => setState(() {
                            isFollowed = true;
                          }),
                          child: Text(
                            "Follow",
                            style: themeContext.textTheme.labelLarge!.copyWith(
                              color: themeContext.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Text(
                      widget.celeb.description,
                      style: themeContext.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: themeContext.colorScheme.surface),
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.r),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(),
          child: Text("Chat with him"),
        ),
      ),
    );
  }

  PopupMenuItem<String> popupMenuItem({
    required String value,
    required String title,
  }) {
    final theme = Theme.of(Get.context!).textTheme;
    return PopupMenuItem(
      value: value,
      child: SizedBox(
        width: 100.w,
        child: Text(title, style: theme.bodyLarge),
      ),
    );
  }
}
