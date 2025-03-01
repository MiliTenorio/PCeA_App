import 'package:pcea_app/features/schedule/domain/entities/schedules.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<void> updateAvailableDates(List<Schedule> availableDates) async {
    await Future.delayed(Duration(seconds: 10));
    //save
  }

  //Nao tenho ideia de como fazer isso ainda
  @override
  Future<String> userName() async {
    await Future.delayed(Duration(seconds: 10));
    //save
    return "Milena";
  }
}