import 'user.dart';

class AttendingPhysicianModel extends User {
  final int specialtyID;

  AttendingPhysicianModel({
    required int super.id,
    required super.name,
    required super.surname,
    required super.ekoid,
    required super.userType,
    required this.specialtyID,
    super.token,
    String? email,
  }) : super();

  factory AttendingPhysicianModel.fromJson(Map<String, dynamic> json) {
    return AttendingPhysicianModel(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      ekoid: json['ekoid'],
      userType: json['userType'],
      specialtyID: json['specialtyID'],
      token: json['token'],
      email: json['email'],
    );
  }

  static List<AttendingPhysicianModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => AttendingPhysicianModel.fromJson(json))
        .toList();
  }
}
