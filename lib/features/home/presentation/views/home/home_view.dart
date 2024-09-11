import 'package:dontlieme_task/features/feed/presentation/views/feed_view.dart';
import 'package:dontlieme_task/features/home/presentation/views/home/widgets/bottom_nav_bar.dart';
import 'package:dontlieme_task/util/resources/r.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FeedView(),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
