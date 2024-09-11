import 'package:dontlieme_task/features/feed/domain/enums/nav_item/nav_item.dart';
import 'package:dontlieme_task/features/feed/presentation/providers/nav_item_provider/nav_item_provider.dart';
import 'package:dontlieme_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(navItemProvider);

    return Container(
      padding: EdgeInsets.all(31.r),
      decoration: BoxDecoration(
        color: R.colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: R.colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          NavItem.values.length,
          (index) {
            final item = NavItem.values[index];
            final isSelected = item == currentItem;
            return InkWell(
              borderRadius: BorderRadius.circular(40.r),
              onTap: () {
                ref.read(navItemProvider.notifier).state = item;
              },
              child: SvgPicture.asset(
                item.svg,
                colorFilter: ColorFilter.mode(
                  isSelected ? R.colors.green : R.colors.black,
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
