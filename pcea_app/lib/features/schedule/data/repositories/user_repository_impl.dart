import 'package:pcea_app/features/schedule/data/datasources/user_datasource.dart';
import 'package:pcea_app/features/schedule/domain/entities/user.dart';
import 'package:pcea_app/features/schedule/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<User> getUser() async {
    try {
      return await _dataSource.getUser();
    } catch (e) {
      rethrow; 
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      await _dataSource.updateUser(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateAvailableDates(List<DateTime> newAvailableDates) async {
    try {
      await _dataSource.updateAvailableDates(newAvailableDates);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateScheduledDates(List<DateTime> newScheduledDates) async {
    try {
      await _dataSource.updateScheduledDates(newScheduledDates);
    } catch (e) {
      rethrow;
    }
  }
}
