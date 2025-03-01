import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';

class UpdateAvailableDates {
  final UserRepository userRepository;

  UpdateAvailableDates(this.userRepository);

  Future<void> call(List<Schedule> availableDates) async {
    await userRepository.updateAvailableDates(availableDates);
  }
}