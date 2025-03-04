import 'package:pcea_app/features/schedule/domain/entities/user.dart';

class UserDataSource {
  Future<User> getUser() async {
    // Retorne um usuário simulado ou de um banco de dados/API
    await Future.delayed(Duration(seconds: 1));
    return User(
      email: "mili@eu.com",
      name: "Milena Tenorio",
      password: "password123",
      scheduledDates: [DateTime(2025, 3, 5),DateTime(2025, 3, 1), DateTime(2025, 3, 3),DateTime(2025, 12, 5),],
      availableDates: [DateTime(2025, 3, 1), DateTime(2025, 3, 3)],
    );
  }

  Future<void> updateUser(User user) async {
    // Implemente a lógica para atualizar o usuário no banco de dados/API
  }

  Future<void> updateAvailableDates(List<DateTime> newAvailableDates) async {
    // Implemente a lógica para atualizar as datas disponíveis
  }

  Future<void> updateScheduledDates(List<DateTime> newScheduledDates) async {
    // Implemente a lógica para atualizar as datas agendadas
  }
}
