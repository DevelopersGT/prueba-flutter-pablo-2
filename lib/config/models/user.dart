class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '', // Modificado de 'firstName' a 'first_name'
      lastName: json['last_name'] ?? '',   // Modificado de 'lastName' a 'last_name'
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}