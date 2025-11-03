// data/models/schedule_status_model.dart
import '../../domain/entities/schedule_status.dart';

class ScheduleStatusModel extends ScheduleStatus {
  ScheduleStatusModel({required super.state, super.scheduledDays});

  factory ScheduleStatusModel.fromJson(Map<String, dynamic> json) {
    return ScheduleStatusModel(
      state: json['state'],
      scheduledDays:
          (json['scheduledDays'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'state': state,
    'scheduledDays': scheduledDays,
  };
}
