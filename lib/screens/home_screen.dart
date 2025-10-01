import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:celeb_voice/widgets/home/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    final FocusNode focusNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => focusNode.unfocus(),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              /// Profile + Search Header
              SliverPersistentHeader(
                delegate: MySliverHeaderDelegate(focusNode: focusNode),
                floating: true,
              ),

              /// Trending Celebs
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        "Trending celebs",
                        style: themeContext.textTheme.titleSmall,
                      ),
                      5.verticalSpace,
                      SizedBox(
                        height: 75.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          physics: const BouncingScrollPhysics(),
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
                                5.verticalSpace,
                                Text(
                                  celebModel[index].name,
                                  style: themeContext.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        "Categories",
                        style: themeContext.textTheme.titleSmall,
                      ),
                      5.verticalSpace,
                    ],
                  ),
                ),
              ),

              /// TabBar (pinned below header)
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    physics: const BouncingScrollPhysics(),
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: "Music"),
                      Tab(text: "Acting"),
                      Tab(text: "Sports"),
                      Tab(text: "Influencer"),
                      Tab(text: "Gaming"),
                      Tab(text: "Theatre"),
                      Tab(text: "Comedy"),
                      Tab(text: "Fashion"),
                    ],
                  ),
                ),
              ),
            ],

            /// TabBarView Content
            body: TabBarView(
              controller: _tabController,
              children: [
                /// Music Tab -> Grid
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10.r),
                    itemCount: celebModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      mainAxisExtent: 150.h,
                      // childAspectRatio: 0.93,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final celeb = celebModel[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          // color: themeContext.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r),
                              ),
                              child: Image.asset(
                                celeb.image,
                                height: 120.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
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
                      );
                    },
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}

/// TabBar Delegate for SliverPersistentHeader
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
