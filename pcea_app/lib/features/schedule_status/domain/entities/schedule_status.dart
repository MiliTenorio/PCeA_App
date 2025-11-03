class ScheduleStatus {
  final int state; // 0 = sem disponibilidade, 1 = aguardando, 2 = escalado
  final List<String> scheduledDays;

  ScheduleStatus({required this.state, this.scheduledDays = const []});
}
