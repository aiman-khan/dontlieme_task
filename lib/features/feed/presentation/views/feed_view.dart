import 'package:dontlieme_task/common/extensions/num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dontlieme_task/features/feed/presentation/providers/user_provider/user_provider.dart';
import 'package:dontlieme_task/features/feed/presentation/views/widgets/images_grid_gallery.dart';
import 'package:dontlieme_task/features/feed/presentation/views/widgets/story_widget.dart';
import 'package:dontlieme_task/features/feed/presentation/views/widgets/tag_widget.dart';
import 'package:dontlieme_task/features/feed/presentation/views/widgets/user_avatar.dart';
import 'package:dontlieme_task/gen/assets.gen.dart';
import 'package:dontlieme_task/util/resources/r.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Column(
        children: [
          _buildHeader(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Consumer(
        builder: (context, ref, _) {
          final user = ref.watch(userProvider);

          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 387.h,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  backgroundColor: R.colors.bgColor,
                  flexibleSpace: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      var top = constraints.biggest.height;
                      var opacity = (top - kToolbarHeight) / 387.h;

                      double scrollPosition = _scrollController.hasClients
                          ? _scrollController.offset
                          : 0.0;

                      double midpoint =
                          _scrollController.position.maxScrollExtent / 2;

                      bool isMidpointReached = scrollPosition >= midpoint;

                      return FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            /// [Images list]
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                                child: Opacity(
                                  opacity: opacity,
                                  child: const StoryWidget(),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20.h,
                              left: 20.w,
                              child: SizedBox(
                                width: 320.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      opacity: !isMidpointReached ? 1.0 : 0.0,
                                      child: Text(
                                        '${user.name}, ${user.age}',
                                        style: TextStyle(
                                          color: R.colors.white,
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      opacity: !isMidpointReached ? 1.0 : 0.0,
                                      child: Text(
                                        user.companyName,
                                        style: TextStyle(
                                          color: R.colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      opacity: !isMidpointReached ? 1.0 : 0.0,
                                      child: Row(
                                        children: [
                                          Assets.svgs.locationIcon.svg(),
                                          10.wb,
                                          Text(
                                            'California, 10 miles away',
                                            style: TextStyle(
                                              color: R.colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ];
            },
            body: Builder(
              builder: (context) {
                double scrollPosition = _scrollController.hasClients
                    ? _scrollController.offset
                    : 0.0;

                double midpoint =
                    _scrollController.position.maxScrollExtent / 2;

                bool isMidpointReached = scrollPosition >= midpoint;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: R.colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedCrossFade(
                                duration: const Duration(milliseconds: 400),
                                crossFadeState: isMidpointReached
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                firstCurve: Curves.decelerate,
                                firstChild: SizedBox(
                                  width: 272.w,
                                  child: Text(
                                    user.about,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: R.colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                secondChild: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user.name}, ${user.age}',
                                      style: TextStyle(
                                        color: R.colors.black,
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      user.companyName,
                                      style: TextStyle(
                                        color: R.colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    12.hb,
                                    Text(
                                      'California, 10 miles away',
                                      style: TextStyle(
                                        color: R.colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              24.hb,

                              /// [Interest Tags]
                              Wrap(
                                runSpacing: 12.h,
                                children: List.generate(
                                  user.interests.length,
                                  (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: TagWidget(
                                        title: user.interests[index],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              16.hb,

                              /// [Share, Fb, Insta Icons]
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: R.colors.white,
                                    child: Assets.svgs.shareIcon.svg(),
                                  ),
                                  12.wb,
                                  CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: R.colors.white,
                                    child: Assets.svgs.fbIcon.svg(),
                                  ),
                                  12.wb,
                                  CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: R.colors.white,
                                    child: Assets.svgs.instaIcon.svg(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.hb,
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 400),
                        crossFadeState: isMidpointReached
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstCurve: Curves.decelerate,
                        firstChild: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: R.colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: SizedBox(
                              width: 272.w,
                              child: Text(
                                user.about,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: R.colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        secondChild: const SizedBox(),
                      ),
                      16.hb,
                      ImagesGridGallery(
                        imageUrls: user.images,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.w,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Assets.svgs.menuIcon.svg(),
            ),
          ),
          Assets.svgs.appLogo.svg(),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Assets.svgs.filterIcon.svg(),
                15.wb,
                UserAvatar(
                  imageUrl: 'https://i.pravatar.cc/1000?img=5',
                  size: 54.r,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
