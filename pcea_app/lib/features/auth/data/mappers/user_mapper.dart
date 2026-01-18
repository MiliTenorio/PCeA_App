import '../../domain/entities/user.dart';
import '../../domain/entities/volunteer.dart';
import '../models/volunteer_model.dart';
import '../models/user_model.dart';

class UserMapper {
  static User toEntity(UserModel model) {
    if (model is VolunteerModel) {
      return Voluntario(
        name: model.name,
        availableDates: model.availableDates,
        email: model.email,
      );
    }

    return User(
      email: model.email,
      role: model.role,
    );
  }
}
