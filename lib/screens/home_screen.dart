import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:celeb_voice/widgets/home/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    final FocusNode focusNode = FocusNode();
    // final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => focusNode.unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverHeaderDelegate(focusNode: focusNode),
                  floating: true,
                  // snap: true,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text("Trending celebs"),
                      SizedBox(
                        height: 70.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.r),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: AssetImage(
                                    celebModel[index].image,
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  celebModel[index].name,
                                  style: themeContext.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SliverPadding(
                //   padding: EdgeInsets.symmetric(vertical: 10.h),
                //   sliver: SliverGrid(
                //     delegate: SliverChildBuilderDelegate((context, index) {
                //       final celeb = celebModel[index];
                //       return Container(
                //         decoration: BoxDecoration(
                //           color: themeContext.colorScheme.surface,
                //           borderRadius: BorderRadius.circular(10.r),
                //           boxShadow: [
                //             BoxShadow(
                //               // color: themeContext.colorScheme.shadow,
                //               blurRadius: 5,
                //               offset: const Offset(0, 1),
                //             ),
                //           ],
                //         ),
                //         child: GestureDetector(
                //           onTap: () => {},
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               ClipRRect(
                //                 borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(10.r),
                //                   topRight: Radius.circular(10.r),
                //                 ),
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(10.r),
                //                   ),
                //                   child: Image.asset(
                //                     celeb.image,
                //                     height: 120.h,
                //                     width: double.infinity,
                //                     fit: BoxFit.cover,
                //                     alignment: Alignment.topCenter,
                //                   ),
                //                 ),
                //               ),

                //               Container(
                //                 // height: 40.h,
                //                 alignment: Alignment.center,
                //                 padding: EdgeInsets.symmetric(horizontal: 6.w),
                //                 child: Text(
                //                   celeb.name,
                //                   style: themeContext.textTheme.bodyMedium,
                //                   // maxLines: 2, /
                //                   // overflow: TextOverflow.ellipsis,
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     }, childCount: celebModel.length),
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 10.w,
                //       mainAxisSpacing: 10.h,
                //       // childAspectRatio:0.8,
                //     ),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: Column(children: [Text("Categories")]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
