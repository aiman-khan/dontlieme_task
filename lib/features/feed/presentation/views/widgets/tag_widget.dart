import 'package:dontlieme_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 18.w,
      ),
      decoration: BoxDecoration(
        color: R.colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
