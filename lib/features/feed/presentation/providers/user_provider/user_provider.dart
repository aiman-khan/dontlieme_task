import 'package:dontlieme_task/features/feed/domain/models/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<UserModel>((ref) {
  return UserModel(
    name: 'Adam',
    age: 26,
    companyName: 'CEO Trinity and Co.',
    images: [
      'https://i.pravatar.cc/1000?img=2',
      'https://i.pravatar.cc/1000?img=4',
      'https://i.pravatar.cc/1000?img=5',
      'https://i.pravatar.cc/1000?img=10',
      'https://i.pravatar.cc/1000?img=7',
    ],
    about:
        'IT millionaire by day, emotional support by night. Like spending my day with a smile and gratitude.',
    interests: ['Yoga', 'Faith', 'Tech Lover', 'Love'],
  );
});
