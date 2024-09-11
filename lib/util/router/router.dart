import 'package:dontlieme_task/features/home/presentation/views/home/home_view.dart';
import 'package:dontlieme_task/util/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
  ],
);
