import 'package:dontlieme_task/gen/assets.gen.dart';

enum NavItem {
  feed,
  like,
  chat,
  about;

  String get svg {
    return switch (this) {
      NavItem.feed => Assets.svgs.homeIcon.path,
      NavItem.like => Assets.svgs.heartIcon.path,
      NavItem.chat => Assets.svgs.chatIcon.path,
      NavItem.about => Assets.svgs.aboutIcon.path,
    };
  }

  bool get isFeed => this == NavItem.feed;

  bool get isLike => this == NavItem.like;

  bool get isChat => this == NavItem.chat;

  bool get isAbout => this == NavItem.about;
}
