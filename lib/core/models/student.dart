import 'user.dart';

class StudentModel extends User {
  final int studentId;

  StudentModel({
    required this.studentId,
    required super.name,
    required super.surname,
    required super.ekoid,
    required super.userType,
    super.id,
    super.token,
    String? email,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['studentId'],
      name: json['name'],
      surname: json['surname'],
      ekoid: json['ekoid'],
      userType: json['userType'],
      id: json['id'],
      token: json['token'],
      email: json['email'],
    );
  }

  static List<StudentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => StudentModel.fromJson(json)).toList();
  }
}
