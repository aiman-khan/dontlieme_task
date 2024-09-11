import 'package:dontlieme_task/features/feed/domain/enums/nav_item/nav_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navItemProvider = StateProvider<NavItem>((ref) {
  return NavItem.feed;
});
