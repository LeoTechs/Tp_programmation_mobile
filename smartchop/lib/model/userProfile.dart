class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  UserProfile(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.imageUrl});

  factory UserProfile.fromMap(Map<String, dynamic> data, String id) {
    return UserProfile(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
