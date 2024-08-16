class User {
  final String name;
  final String surname;
  final String ekoid;
  final int userType;
  final int? id;
  final String? token;

  User({
    required this.name,
    required this.surname,
    required this.ekoid,
    required this.userType,
    this.id,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: null,
      name: json['name'],
      surname: json['surname'],
      ekoid: json['ekoid'],
      userType: json['userType'],
    );
  }
}
