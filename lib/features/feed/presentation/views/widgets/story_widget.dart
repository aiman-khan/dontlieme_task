import 'package:dontlieme_task/features/feed/presentation/providers/user_provider/user_provider.dart';
import 'package:dontlieme_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryWidget extends ConsumerStatefulWidget {
  const StoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends ConsumerState<StoryWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap(bool isNext, List<String> imageUrls) {
    if (isNext) {
      if (_currentIndex < imageUrls.length - 1) {
        setState(() {
          _currentIndex++;
        });
        _animationController.reset();
        _animationController.forward();
      }
    } else {
      if (_currentIndex > 0) {
        setState(() {
          _currentIndex--;
        });
        _animationController.reset();
        _animationController.forward();
      }
    }
  }

  Widget _buildProgressBars(List<String> imageUrls) {
    return Row(
      children: List.generate(imageUrls.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LinearProgressIndicator(
              minHeight: 2.h,
              value: index == _currentIndex
                  ? _animationController.value
                  : (index < _currentIndex ? 1.0 : 0.0),
              backgroundColor: R.colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(R.colors.green),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return GestureDetector(
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        if (details.localPosition.dx < width / 2) {
          _onTap(false, user.images);
        } else {
          _onTap(true, user.images);
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: user.images[_currentIndex],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            child: Row(
              children: [
                Expanded(
                  child: _buildProgressBars(user.images),
                ),
                Icon(
                  Icons.more_vert,
                  color: R.colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
