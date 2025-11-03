import '../../domain/entities/schedule_status.dart';

abstract class ScheduleStatusDataSource {
  Future<ScheduleStatus> getScheduleStatus();
  Future<void> setAvailableDates(List<String> dates);
}

class ScheduleStatusLocalDataSourceImpl implements ScheduleStatusDataSource {
  ScheduleStatus _mockStatus = ScheduleStatus(state: 0);

  @override
  Future<ScheduleStatus> getScheduleStatus() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockStatus;
  }

  @override
  Future<void> setAvailableDates(List<String> dates) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (dates.isEmpty) {
      _mockStatus = ScheduleStatus(state: 0);
    } else {
      _mockStatus = ScheduleStatus(state: 1);
    }
  }
}
