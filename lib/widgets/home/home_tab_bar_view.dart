import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

TabBarView homeTabView(ThemeData themeContext, TabController tabController) {
  return TabBarView(
    controller: tabController,
    children: [
      /// Music Tab -> Grid
      GridView.builder(
        padding: EdgeInsets.all(10.r),
        itemCount: celebModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 160.h,
          // childAspectRatio: 0.93,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final celeb = celebModel[index];
          return GestureDetector(
            onTap: () => Get.toNamed(
              "/celeb-page",
              arguments: celeb, 
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.amber,
                // color: themeContext.colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    // only(
                    //   topLeft: Radius.circular(10.r),
                    //   topRight: Radius.circular(10.r),
                    // ),
                    child: Hero(
                      tag: celeb.image,
                      child: Image.asset(
                        celeb.image,
                        height: 130.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    child: Container(
                      height: 30.h,
                      alignment: Alignment.center,

                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        celeb.name,
                        style: themeContext.textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      /// Other tabs (placeholders for now)
      const Center(child: Text("Acting")),
      const Center(child: Text("Sports")),
      const Center(child: Text("Influencer")),
      const Center(child: Text("Gaming")),
      const Center(child: Text("Theatre")),
      const Center(child: Text("Comedy")),
      const Center(child: Text("Fashion")),
    ],
  );
}
