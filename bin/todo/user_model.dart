class User {
  final int id;
  final String? imagePath;
  final String username;

  User({
    required this.id,
    required this.imagePath,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      imagePath: json['image_path'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_path': imagePath,
      'username': username,
    };
  }
}