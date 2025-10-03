import 'package:celeb_voice/model/home_celebrity.dart';
import 'package:celeb_voice/widgets/home/home_tab_bar_view.dart';
import 'package:celeb_voice/widgets/home/sliver_header.dart';
import 'package:celeb_voice/widgets/home/tabbar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                        style: themeContext.textTheme.titleMedium,
                      ),
                      5.verticalSpace,
            
                      SizedBox(
                        height: 75.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: celebModel.length + 1, // +1 for "View All"
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index == celebModel.length) {
                              // Last item = View All
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.r),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to all celebs page
                                  },
                                  child: Text(
                                    "View All",
                                    style: themeContext.textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }
            
                            // Normal celeb item
                            final celeb = celebModel[index];
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.r),
                              child: InkWell(
                                onTap: () => Get.toNamed(
                                  "/celeb-page",
                                  arguments: celeb,
                                ),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: celeb.image,
                                      child: CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: AssetImage(
                                          celeb.image,
                                        ),
                                      ),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      celeb.name,
                                      style: themeContext.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            
                      20.verticalSpace,
                      Text(
                        "Categories",
                        style: themeContext.textTheme.titleMedium,
                      ),
                      5.verticalSpace,
                    ],
                  ),
                ),
              ),
            
              /// TabBar (pinned below header)
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(
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
            body: homeTabView(themeContext, _tabController),
          ),
        ),
      ),
    );
  }
}
