import 'user_model.dart';
import 'package:pcea_app/core/utils/enums.dart';

class VolunteerModel extends UserModel {
  final String name;
  final List<DateTime> availableDates;

  VolunteerModel({
    required this.name,
    required this.availableDates,
    required super.email,
  }) : super(role: UserRole.VOLUNTEER);

  factory VolunteerModel.fromJson(Map<String, dynamic> json) {
    return VolunteerModel(
      name: json['nome'],
      email: json['usuario']['email'],
      availableDates: (json['datasDisponiveis'] as List<dynamic>)
          .map((e) => DateTime.parse(e))
          .toList(),
    );
  }
}
