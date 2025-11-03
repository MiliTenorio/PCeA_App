import 'package:mobx/mobx.dart';
import 'package:pcea_app/features/schedule_status/domain/entities/schedule_status_local_data_source.dart';

import '../../domain/entities/schedule_status.dart';

part 'schedule_status_store.g.dart';

class ScheduleStatusStore = _ScheduleStatusStoreBase with _$ScheduleStatusStore;

abstract class _ScheduleStatusStoreBase with Store {
  final ScheduleStatusDataSource dataSource;

  _ScheduleStatusStoreBase(this.dataSource);

  @observable
  ScheduleStatus? scheduleStatus;

  @observable
  bool isLoading = false;

  @action
  Future<void> loadStatus() async {
    isLoading = true;
    scheduleStatus = await dataSource.getScheduleStatus();
    isLoading = false;
  }

  @action
  Future<void> setAvailableDates(List<String> dates) async {
    await dataSource.setAvailableDates(dates);
    await loadStatus();
  }

  @action
  void simulateBeingScheduled() {
    scheduleStatus = ScheduleStatus(
      state: 2,
      scheduledDays: ['10/11', '17/11'],
    );
  }
}
