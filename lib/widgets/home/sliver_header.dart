import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
final FocusNode focusNode;

  MySliverHeaderDelegate({required this.focusNode});
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      child: Column(
        children: [
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage(
                  "assets/images/celebrity/profile.jpg",
                ),
              ),
              Text(
                "Celeb Voice",
                // style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.gear)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none),
                  ),
                ],
              ),
            ],
          ),
          10.verticalSpace,
          TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
              hint: Text("Find your favorite celebrity"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 142.r; // Maximum height of the header

  @override
  double get minExtent => 142.r; // Minimum height of the header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Rebuild only if necessary
  }
}
