import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';

class UpdateAvailableDatesUseCase {
  final UserRepository _userRepository;

  UpdateAvailableDatesUseCase(this._userRepository);

  Future<void> call(List<DateTime> newAvailableDates) async {
    await _userRepository.updateAvailableDates(newAvailableDates);
  }
}
