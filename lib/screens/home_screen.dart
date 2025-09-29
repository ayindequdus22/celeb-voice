import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:celeb_voice/widgets/home/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeContext = Theme.of(context);
    // final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // SliverAppBar(
          //   floating: true,
          //   leading: CircleAvatar(
          //     radius: 100.r,
          //     backgroundImage: AssetImage(
          //       "assets/images/celebrity/profile.jpg",
          //     ),
          //   ),
          //   snap: true,
          //   // backgroundColor: Colors.white,
          //   elevation: 0,
          //   centerTitle: true,
          //   title: Text(
          //     "Celeb Voice",
          //     style: themeContext.textTheme.headlineSmall!.copyWith(
          //       color: themeContext.colorScheme.primary,
          //     ),
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(10.r),
          //     child: TextFormField(
          //       decoration: InputDecoration(
          //         hint: Text("Find your favorite celebrity"),
          //       ),
          //     ),
          //   ),
          // ),

          SliverPersistentHeader(delegate:SliverPersistentHeaderExample()        ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final celeb = celebModel[index];
                return Container(
                  decoration: BoxDecoration(
                    color: themeContext.colorScheme.surface,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        // color: themeContext.colorScheme.shadow,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => {print("object ")},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Image.asset(
                              celeb.image,
                              height: 120.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),

                        Container(
                          // height: 40.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            celeb.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                            // maxLines: 2, /
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: celebModel.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                // childAspectRatio:0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _CustomHeaderDelegate oldDelegate) {
    return child != oldDelegate.child ||
        minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight;
  }
}
