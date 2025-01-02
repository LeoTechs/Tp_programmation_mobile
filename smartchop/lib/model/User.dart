class User {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String? imageUrl;

  User(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        imageUrl: map['imageUrl']);
  }

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email, password: $password, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      imageUrl.hashCode;

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  User.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        password = json['password'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'password': password,
        'imageUrl': imageUrl
      };
}
