import 'package:dontlieme_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: isLiked
          ? Assets.pngs.unlikeIcon.image(
              height: 62.r,
              width: 62.r,
            )
          : Assets.pngs.likeIcon.image(
              height: 62.r,
              width: 62.r,
            ),
    );
  }
}
