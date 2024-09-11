class UserModel {
  final String name;
  final int age;
  final String companyName;
  final List<String> images;
  final String about;
  final List<String> interests;

  UserModel({
    required this.name,
    required this.age,
    required this.companyName,
    required this.images,
    required this.about,
    required this.interests,
  });
}
